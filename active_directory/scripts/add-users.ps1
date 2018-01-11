Import-module activedirectory

$Users=Import-csv c:\scripts\add-users.csv


$a=1;
$b=1;
$failedUsers = @()
$usersAlreadyExist =@()
$successUsers = @()
$VerbosePreference = "Continue"
$LogFolder = "c:\scripts\logs"
$GroupName = "training Users"
$OU = "CN=Users, DC=training,DC=LOCAL"

NEW-ADGroup -name $GroupName –GroupScope Global

ForEach($User in $Users){
$User.FirstName = $User.FirstName.substring(0,1).toupper()+$User.FirstName.substring(1).tolower()
$FullName = $User.FirstName
$Sam = $User.FirstName
$dnsroot = '@' + (Get-ADDomain).dnsroot
$SAM = $sam.tolower()
$UPN = $SAM + "$dnsroot"
$email = $Sam + "$dnsroot"
$password = $user.password
try {
if (!(get-aduser -Filter {samaccountname -eq "$SAM"})){
New-ADUser -Name $FullName -AccountPassword (ConvertTo-SecureString $password -AsPlainText -force) -GivenName $User.FirstName  -Path $OU -SamAccountName $SAM -UserPrincipalName $UPN -EmailAddress $Email -Enabled $TRUE
Add-ADGroupMember -Identity $GroupName -Member $Sam
Write-Verbose "[PASS] Created $FullName"
$successUsers += $FullName
}
}

catch {
Write-Warning "[ERROR]Can't create user [$($FullName)] : $_"
$failedUsers += $FullName
}
}

if ( !(test-path $LogFolder)) {
Write-Verbose "Folder [$($LogFolder)] does not exist, creating"
new-item $LogFolder -type directory -Force
}

Write-verbose "Writing logs"
$failedUsers |ForEach-Object {"$($b).) $($_)"; $b++} | out-file -FilePath  $LogFolder\FailedUsers.log -Force -Verbose
$successUsers | ForEach-Object {"$($a).) $($_)"; $a++} |out-file -FilePath  $LogFolder\successUsers.log -Force -Verbose
