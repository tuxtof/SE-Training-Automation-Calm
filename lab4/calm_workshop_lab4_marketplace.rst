***************************************
**NuCalm Blueprint Marketplace part 1**
***************************************

.. contents::


Lab Overview
************

In this lab we will learn how to manage NuCalm Blueprints within the NuCalm Marketplace.  After this lab
we should know how to navigate and manage the Marketplace, publish blueprints to the market, deploy and/or clone
blueprints from the marketplace.

**Part 1: Accessing and Navigating Calm**
*****************************************

Getting Familiar with the Tools

1. Connect to https://[10.x.x.39]:9440
2. Login to Prism Central with admin user and using the HPOC credentials
3. Click on the Apps tab across the top of Prism



**Part 2: Marketplace Control - Publish Blueprints**
****************************************************

Navigate the to Marketplace control by clicking (|image1|) icon located on the left tool ribbon.  This will open the Marketplace Control Center where pre-configured and self-authored blueprints are staged for publishing to the local Marketplace used for teaming and collaboration.

In this exercise we'll walk through the steps to:

1. Publish the pre-configured MongoDB Blueprint to the local Marketplace
2. Clone the Blueprint from the Marketplace for editing.
3. Edit the blueprint and launch as an application.

Make sure *Marketplace Blueprints* is selected along the top of the Blueprint grid. Locate the **Mongo** blueprint within the grid and click the checkbox.

|image2|

Once the **Mongo** Blueprint has been selected, a catalog is displayed to the right of the grid containing a blueprint description, category, and project assignment. Insure both **Database** and **Calm** are selected for the categroy and project repsectively, and click *apply*.

|image3|

Click **Publish**, and wait until the Blueprint status shows *published* in the grid as shown below.

|image4|

**Part 3: Marketplace - Clone Blueprint**
*****************************************

Navigate to the Marketplace by clicking (|image5|) icon located on the left tool ribbon.  This will open the Marketplace. Once Marketplace is displayed, the **Mongo** Blueprint icon should be visible...

|image6|


Click the **Mongo** Blueprint Icon and then click **Clone** to copy the blueprint to the Blueprint workspace for editing.

|image7|

- Give a blueprint name -> **training-mongo**
- Assign to the **calm** project

**Part 4: Edit + Debug + Launch Cloned Blueprint**
**************************************************

Navigate the Blueprint workspace by clicking the (|image8|) icon located on the left tool ribbon.  This will open the Blueprint Workspace.

|image9|

Click the red exclamation point to see a list fo error desriptions.

|image10|

Fix each of the errors listed within the Blueprint.  Once all the errors have been corrected, make additional needed changes to each of the **Mongo** services (i.e. VM, Package, etc...) and launch the blueprint.  Continue to make changes until the the Blueprint successfully deploys.

If you decide to use the blueprint embeded image, you need correctly configure SSH keys (private and public part),
for that try to generate your own ssh keys and replace it in the blueprint.

To generate your own SSH key use the 'ssh-keygen' command (if you don't have this command on your laptop you can run it from a cvm)

You can also look in each service how cloudinit inject the public key for a specified user.





.. |image1| image:: ./media/image4.png

.. |image2| image:: ./media/image5.png

.. |image3| image:: ./media/image8.png

.. |image4| image:: ./media/image9.png

.. |image5| image:: ./media/image10.png

.. |image6| image:: ./media/image11.png

.. |image7| image:: ./media/image13.png

.. |image8| image:: ./media/image14.png

.. |image9| image:: ./media/image15.png

.. |image10| image:: ./media/image16.png
