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


**Configure Prism Central for Workshop**
****************************************

We will start by installing prism Central


**Step 1 — Install Prism Central**
**********************************

1. Click on **Register or create new** on the Prism Central Widget (On the main Cluster page)
2. Click on **Deploy** in the "I want to deploy a new Prims Central instance" box
3. 5.5.x must be showed under available version (we already upload it), so just click **Install** next to 5.5.x.
4. If it does not show up, the you will need to click on **upload the Prism Central binary** (The tar & json files are available on Nutanix Portal)
5. Input the following info, and then click **Deploy**:

+--------------------------+------------------------------------------+
| VM Name                  |                             PC           |
+--------------------------+------------------------------------------+
| Container                |                             training     |
+--------------------------+------------------------------------------+
| VM Sizing                |                             Large        |
+--------------------------+------------------------------------------+
| AHV Network              |                             training     |
+--------------------------+------------------------------------------+
| IP Address               |                             10.x.x.39    |
+--------------------------+------------------------------------------+

**Note:** PC Large sizing is highly recommended with Calm in order to have good performance.

7. In a separate browser tab, got to https://10.x.x.39:9440
8. Log in with admin / Nutanix/4u
9. Change password to HPOC Password
10. Continue log in with admin / HPOC Password
11. Accept the EULA


**Step 2 — Register Prism Central**
***********************************

1. Go to the Prism Element browser tab
2. Click on **Register or create new** on the Prism Central Widget (On the main Cluster page)
3. Click on **Connect** in the "I already have a Prism Central instance deployed" box
4. Click **Next**
5. Enter the following info, and then Click **Connect**:

+--------------------------+------------------------------------------+
| Prism Central IP         |                          10.x.x.39       |
+--------------------------+------------------------------------------+
| Username                 |                          admin           |
+--------------------------+------------------------------------------+
| Password                 |                          HPOC Password   |
+--------------------------+------------------------------------------+

6. You should now see **OK** int he Prism Central Widget (On the main Cluster page)
7. You could verify that your cluster is visible in the Prism Central interface, for exemple in the Cluster Quick Access widget


**Step 3 — PC UI Settings**
***************************

Change Prism Central UI Settings

1. Go To Gear --> UI Settings
2. Enable animated background particles = Unchecked
3. Session Timeout for Current User = 30 minutes
4. Default Session Timeout for all Users = 2 hours
5. Session Timeout override = Allow unlimited


**Step 4 — Setup Authentication and Role Mapping**
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
| Directory URL              |           ldap://10.x.x.40             |
+----------------------------+----------------------------------------+
| Service Account Name       |           administrator@poclab.local   |
+----------------------------+----------------------------------------+
| Service Account Password   |           HPOC Password                |
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
| Values                     |           user01                       |
+----------------------------+----------------------------------------+

6. Click save in the Role Mapping and Authentication windows
7. Log out of Prism Central
8. Log in as **user01@poclab.local**
9. Once you validate you can log in as user01, log out
10. Log back into Prism Central as admin


**Step 5 — Configure Self-Service Admin Management**
****************************************************

In this section we will configure Self-Service Portal (SSP)

1. Go to Gear --> Self-Service Admin Management
2. Fill in the following info under Connect to AD, and then click **Next**:

+--------------------------+------------------------------------------+
| Select Active Directory  |            training                      |
+--------------------------+------------------------------------------+
| Username                 |            administrator@poclab.local    |
+--------------------------+------------------------------------------+
| Password                 |            HPOC Password                 |
+--------------------------+------------------------------------------+

3. Click on **Add Admins**, and add the "Administrators (group)" group. Click **Save**
4. Click **Save**


**Step 6 — Enable App Management**
**********************************

In this section we will enable the Apps tab (Calm) of Prism Central

1. Go to Gear --> Enable App Management
2. Check the box for **Enable App Management**
3. Verify the box is checked for **Enable Nutanix Seeded Blueprints**
4. Click **Save**
5. Monitor Recent Tasks, and watch for the "Volume Group", "Volume Disk", and "Batch Configure" Tasks to complete
6. Click on the **Apps** Tab in the Top Navigation Ribbon
7. If you see the Calm UI you are done


**Step 7 — Create Project for use in Calm**
*******************************************

In this section will create a project for use with SSP & Calm

1. Go to Explore --> Projects
2. Click on **Create Project**
3. Project Name = calm
4. Enter Description if you like
5. Click **+ User**
6. Enter the following info, and click **Save**

+----------------------------+----------------------------------------+
| Name (User or Group) :     |           training Users (group)       |
+----------------------------+----------------------------------------+
| Role :                     |           Developer                    |
+----------------------------+----------------------------------------+

7. Check the box for the **training** network, and make it **Default**
8. Quotas (Optional)
9. Click **Save**

**Note:** If the Users or Group you added are SSP Admins (like user01) they will not show as group members. This is because they are already admins, and have access.
