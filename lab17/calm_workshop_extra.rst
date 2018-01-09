*************************************
**NuCalm extra Lab                 **
*************************************

.. contents::

Lab Overview
************

In this lab we will learn how to manage Blueprints within the NuCalm Marketplace.  After this lab
we should know how to navigate Marketplace Management and configure the Project Environment to deploy Blueprints
from the Marketplace.

In this exercise we'll walk through the steps to:

1. Publish a Blueprint from the Blueprint Workspace to the local Marketplace.
2. Use the Marketplace Manager to approve, assign roles and projects, and publish to the Marketplace.
3. Edit the Project Environment so the blueprint can be launched from the Marketplace as an application.

**Note:** This lab assumes pariticipants have Blueprints built and staged from previous exercises.

Part 1: Accessing and Navigating Calm
*************************************

Getting Familiar with the Tools

1. Connect to https://[10.x.x.39]:9440
2. Login to Prism using your credentials
3. Click on the Apps tab across the top of Prism

Part 2: Using EScript
************************************************

The Calm product support a builtin engine script who allow run some task directly from Calm/PC instance. This engine don't need any VM/services to be used.

This script engine is based on a Python like syntax. Supported modules and functions are available in the `ESscript documentation`_. You can also find a sample script at the end of the documentation.

Try to modify one of your previous blueprint to integrate interaction with external world, you can try to implement notification of deployment via Slack:

- create an EScript Execute Task for one of your service in service create action
- post in specific channel #xxxx (the trainer invite you to the channel) by using the EScript example below
- improve EScript by reading `Slack Incoming Webhooks documentation`_


**Example of Slack integration script:**

.. code-block:: python

    #script

    headers = {'Content-Type': 'application/json'}
    api_url = "@@{SLACK_HOOK}@@"

    payload = {
      'text': 'Server @@{calm_application_name}@@ was just deployed <http://@@{calm_application_name}@@.training.local/|click here> to connect !',
      'username': '@@{HPOC_number/Team_name}@@'
    }

    r = urlreq(api_url, verb='POST', headers=headers, params=json.dumps(payload))
    if r.ok:
      print r.content
    else:
      print "Post request failed", r.content
      exit(1)

**note 1**: Ensure that your script always starts with #script

**note 2**: You need to define each variable used in the sample scripts

**note 3**: be carreful to create **@@{SLACK_HOOK}@@** variable as secret and to not share the URL because it's allow full access to the Slack channel

Part 3: Installing Karan Service
********************************

Karan is a Nutanix Calm component which is used to run windows Powershell scripts on the target machines.

You can follow the `Karan documentation`_ to install it on a dedicated proxy server:

- Use the HPOC windows 2012 template to create a new virtual machine following the **Karan Service Hardware Requirements**
- Configure IP address to 10.x.x.41 (based ou your HPOC network)
- Download, Install and Configure the Karan executable
- Prepare a Karan ready Windows template
- try to deploy it with calm and run some powershell script inside


.. _`ESscript documentation`: https://portal.nutanix.com/#/page/docs/details?targetId=Nutanix-Calm-Admin-Operations-Guide-v10:nuc-supported-escript-modules-functions-c.html
.. _`Slack Incoming Webhooks documentation`: https://api.slack.com/custom-integrations/incoming-webhooks
.. _`Karan documentation`: https://portal.nutanix.com/#/page/docs/details?targetId=Nutanix-Calm-Admin-Operations-Guide-v10:nuc-installing-karan-service-t.html
