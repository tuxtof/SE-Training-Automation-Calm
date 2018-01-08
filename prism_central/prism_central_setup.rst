**********************************
**Configuring HPOC Prism Central**
**********************************

.. contents::


**This Setup Guide is designed with these assumtpitons**
********************************************************

1. AOS 5.5.x (or higher)
2. AHV (for 5.5)


**Connectivity Instructions:**
******************************

+--------------------------+------------------------------------------+
| Prism Central IP         |                             Cluster IP   |
+--------------------------+------------------------------------------+
| Username                 |                             Cluster User |
+--------------------------+------------------------------------------+
| Password                 |                             Cluster Pass |
+--------------------------+------------------------------------------+


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
3. If 5.5.x shows under available version, click **Download**.
4. If it does not show up, the you will need to click on **upload the Prism Central binary** (The tar & json files should be available on POCFS/HPOC-AFS)
5. Click on **Install** next to 5.5.x
6. Input the following info, and then click **Deploy**:

+--------------------------+------------------------------------------+
| VM Name                  |                             PC           |
+--------------------------+------------------------------------------+
| Container                |                             Bootcamp     |
+--------------------------+------------------------------------------+
| VM Sizing                |                             Small        |
+--------------------------+------------------------------------------+
| AHV Network              |                             bootcamp     |
+--------------------------+------------------------------------------+
| IP Address               |                             10.x.x.39    |
+--------------------------+------------------------------------------+

**Note:** Once the Prism Central deployment task finishes, move on

7. In s separate browser tab, got to https://10.x.x.39:9440
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


**Step 3 — UI Settings**
************************

Change Session Timeout Values

1. Go To Gear --> UI Settings
2. Session Timeout for Current User = 30 minutes
3. Default Session Timeout for all Users = 2 hours
4. Session Timeout override = Allow unlimited


**Step 4 — Setup Authentication and Role Mapping**
**************************************************

1. Go To Gear --> Authentication
2. Select **New Directory**

+----------------------------+----------------------------------------+
| Directory Type             |           Active Directory             |
+----------------------------+----------------------------------------+
| Name                       |           Bootcamp                     |
+----------------------------+----------------------------------------+
| Domain                     |           bootcamp.local               |
+----------------------------+----------------------------------------+
| Directory URL              |           ldap://10.x.x.40             |
+----------------------------+----------------------------------------+
| Service Account Name       |           administrator@bootcamp.local |
+----------------------------+----------------------------------------+
| Service Account Password   |           HPOC Password                |
+----------------------------+----------------------------------------+

3. Click on the yellow ! next to Bootcamp
4. Click on the **Click Here** to go to the Role Mapping screen
5. Click **New Mapping**

+----------------------------+----------------------------------------+
| Directory                  |           Bootcamp                     |
+----------------------------+----------------------------------------+
| LDAP Type                  |           group                        |
+----------------------------+----------------------------------------+
| Role                       |           Cluster Admin                |
+----------------------------+----------------------------------------+
| Values                     |           Bootcamp Users               |
+----------------------------+----------------------------------------+

6. Close the Role Mapping and Authentication windows
7. Log out of Prism Central
8. Log in as **user01@bootcamp.local**
9. Once you validate you can log in as user01, log out
10. Log back into Prism Central as admin


**Step 5 — Configure Self-Service Admin Management**
****************************************************

In this section we will configure Self-Service Portal (SSP)

1. Go to Gear --> Self-Service Admin Management
2. Fill in the following info under Connect to AD, and then click **Next**:

+--------------------------+------------------------------------------+
| Select Active Directory  |            Bootcamp                      |
+--------------------------+------------------------------------------+
| Username                 |            administrator@bootcamp.local  |
+--------------------------+------------------------------------------+
| Password                 |            HPOC Password                 |
+--------------------------+------------------------------------------+

3. Click on **Add Admins**, and add the "Bootcamp Users" group. Click **Save**
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
3. Project Name = Calm
4. Enter Description if you like
5. Click **User**
6. Enter the following info, and click **Save**

+----------------------------+----------------------------------------+
| Name (User or Group)       |           Bootcamp Users (group)       |
+----------------------------+----------------------------------------+
| Role                       |           Developer                    |
+----------------------------+----------------------------------------+

7. Check the box for the **bootcamp** network, and make it **Default**
8. Quotas (Optional)
9. Click **Save**

**Note:** If the Users or Group you added are SSP Admins they will not show as group members. This is because they are already admins, and have access.


**Step 8 — Go forth and Create / Demo / Build / Have Fun**
**********************************************************

Build Some Blueprints / Applications / or deploy from the Marketplace
