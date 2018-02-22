**********************************
**Configuring HPOC Prism Central**
**********************************

.. contents::


**This Setup Guide is designed with these assumtpitons**
********************************************************

1. AOS 5.5.x (or higher)
2. AHV (for 5.5)




**Overview**
************

In this guide we will configure Prism Central for the HPOC you have checked out. This includes SSP and Calm (Apps).


**Step 1 — PC UI Settings**
***************************

Change Prism Central UI Settings

1. Go To Gear --> UI Settings
2. Enable animated background particles = Unchecked
3. Session Timeout for Current User = 30 minutes
4. Default Session Timeout for all Users = 2 hours
5. Session Timeout override = Allow unlimited


**Step 2 — Setup Authentication and Role Mapping**
**************************************************

1. Go To Gear --> Authentication
2. Select **New Directory**

+----------------------------+----------------------------------------+
| Directory Type             |           Active Directory             |
+----------------------------+----------------------------------------+
| Name                       |           poclab                       |
+----------------------------+----------------------------------------+
| Domain                     |           poclab.local                 |
+----------------------------+----------------------------------------+
| Directory URL              |           ldaps://10.21.x.40           |
+----------------------------+----------------------------------------+
| Service Account Name       |           administrator@poclab.local   |
+----------------------------+----------------------------------------+
| Service Account Password   |           nutanix/4u                   |
+----------------------------+----------------------------------------+

3. Click on the yellow ! next to training
4. Click on the **Click Here** to go to the Role Mapping screen
5. Click **New Mapping**

+----------------------------+----------------------------------------+
| Directory                  |           poclab                       |
+----------------------------+----------------------------------------+
| LDAP Type                  |           user                         |
+----------------------------+----------------------------------------+
| Role                       |           Cluster Admin                |
+----------------------------+----------------------------------------+
| Values                     |           adminuser01                  |
+----------------------------+----------------------------------------+

6. Click save in the Role Mapping and Authentication windows
7. Log out of Prism Central
8. Log in as **adminuser01@poclab.local**
9. Once you validate you can log in as adminuser01, log out
10. Log back into Prism Central as admin


**Step 3 — Configure Self-Service Admin Management**
****************************************************

In this section we will configure Self-Service Portal (SSP)

1. Go to Help (? icon top right) --> Self-Service & Apps setup
2. Fill in the following info under Connect to AD, and then click **Next**:

+--------------------------+------------------------------------------+
| Select Active Directory  |            poclab                        |
+--------------------------+------------------------------------------+
| Username                 |            administrator@poclab.local    |
+--------------------------+------------------------------------------+
| Password                 |            nutanix/4u                    |
+--------------------------+------------------------------------------+

3. Click on **Add Admins**, and add the "Administrators (group)" group. Click **Next**
4. Click **Next**


**Step 4 — Enable App Management**
**********************************

In this section we will enable the Apps tab (Calm) of Prism Central

1. Check the box for **Enable App Management**
2. Verify the box is checked for **Enable Nutanix Seeded Blueprints**
3. Click **Next**
4. Monitor Recent Tasks, and watch for the "Volume Group", "Volume Disk", and "Batch Configure" Tasks to complete
5. Click on the **Apps** Tab in the Top Navigation Ribbon
6. If you see the Calm UI you are done


**Step 5 — Create Project for use in Calm**
*******************************************

In this section will create a project for use with SSP & Calm

1. Go to Explore --> Projects
2. Click on **Create Project**
3. Project Name = calm
4. Enter Description if you like
5. Click **+ User**
6. Enter the following info, and click **Save**

+----------------------------+----------------------------------------+
| Name (User or Group) :     |           SSP Developers (group)       |
+----------------------------+----------------------------------------+
| Role :                     |           Developer                    |
+----------------------------+----------------------------------------+

7. Check the box for the **bootcamp** network, and make it **Default**
8. Quotas (Optional)
9. Click **Save**

**Note:** If the Users or Group you added are SSP Admins (like user01) they will not show as group members. This is because they are already admins, and have access.
