DEVWKS-2083

The Journey of Automating Network Compliance with Cisco NSO

Workshop Banner



🚀 Welcome!

Welcome to your hands-on workshop on automating network compliance with Cisco NSO.
You’ll learn how to create, audit, and remediate compliance across your network devices—empowering you to maintain a secure and consistent environment.



🛠️ Getting Started

Before you begin:


Ensure your VPN connection is active
Open your browser and go to: http://10.10.20.47:8080/

Credentials:


Username: admin
Password: admin


1️⃣ Device Synchronization

Goal: Ensure all network devices are synchronized with NSO.


Steps:


Go to the Devices list
Devices List
Select all devices
Select All
Click Sync from to synchronize device configurations
Sync From
When all devices are in sync, click Done


2️⃣ Creating a Compliance Template

A. Start a New Compliance Template

Open the Configuration Editor
Config Editor
Select ncs:compliance
Select Compliance
Click Edit Config (top), then click the + button to add a template
Add Template
Name your template:
vtp_ntp_check
Template Name


Tip:
Green bars indicate the configuration is staged as "candidate." It will only be pushed after you commit.




B. Define Device Types

Select your new template, then click + to add a device type
Add Device Type
Choose the NED: cisco-iosxr-cli-7.65
Select NED


C. Specify Compliance Checks

For IOS-XR Devices:

Click the NED name (cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65), then click config
Set compliance requirements:
VTP:
Go to vtp and set mode to off
VTP Mode Off
NTP:
Set Max Associations
Max Associations
Add Peer Address
Peer Address
Add Server Address
Server Address
For server IP 2.2.2.2, set minpool (8) and maxpool (12)
Pool Values


D. Commit Your Template

Open Commit Manager (launchpad icon, top right)
Go to the config tab
Review green-highlighted changes
Click Commit, then confirm


Note:
To check compliance for additional device types, repeat this process with the appropriate NED.




3️⃣ Creating & Running a Compliance Report

A. Create the Compliance Report

Go to Tools → Compliance Reports
Navigate to Reports
Click + New report
New Report
Name your report (e.g., vtp_ntp_report), then click Create
Report Name
On the Devices tab, select All devices
Select All Devices
In Compliance Reports, click Add Template and select vtp_ntp_check
Add Template
Click Create Report
Create Report


B. Run the Report

Click Run Report
Run Report
Name the run (e.g., vtp_ntp_run) and confirm
Run Name
View the results via the pop-up or under Tools → Report Results

Example Outcome

Compliance summary (e.g., 78% compliant, 2 devices non-compliant)
Click View details on non-compliant devices to see missing configurations
Non-compliant Details


4️⃣ Remediation: Creating & Applying a Device Template

A. Create a Remediation Template

Open Config Editor (left menu)
Select ncs:devices
Select Devices
Click Edit Config, then click + under Templates
Edit Config
Name your template (e.g., vtp_ntp_remediation)
Remediation Name
Add the NED (cisco-iosxr-cli-7.65) and specify the necessary VTP and NTP configurations
Configure Remediation-Pool Values
Commit your changes


B. Apply the Remediation Template

In Devices, select the devices to remediate
Choose Actions → Apply template
Apply Template
Select your remediation template and click Apply
Template Apply
Commit the pending changes from the launchpad
Commit Changes


Tip:
NSO automatically skips changes for devices that are already compliant.




5️⃣ Re-Run the Compliance Report

Go to Tools → Compliance Reports
Click the ... menu on your report, then Run Report
Rerun Report
Name the run (e.g., ntp_run_2) and execute
Run Again
Check the results—you should now see full compliance!
Compliant ResultsCompliant ResultsCompliant Results


Optional:
Export your compliance report to PDF for documentation or sharing.




🎉 Congratulations!

You’ve automated compliance checks, auditing, and remediation using Cisco NSO.
This process keeps your network secure, consistent, and easy to manage.



<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
Built with ❤️ by Cisco CX Automation Team | Cisco Live 2026
</div>

