Since the compliance report revealed non-compliant devices, you need a device template to push the missing configuration. In this task you will create a device template with the correct NTP settings and prepare it for deployment.

Double-click **Config Editor** in the left menu.

Select the **ncs:devices** module.

![ncs:devices](../assets/images/_025.png)

Click **Edit Config**.

![Edit Config](../assets/images/4_76.png)

Click **Template**, then the **+** button.

![Add template](../assets/images/_027.png)

Name it **ntp_remediation** and click **Confirm**.

![ntp_remediation](../assets/images/4_77.png)

Click on the **ntp_remediation** template.

![Select template](../assets/images/4_78.png)

Select the **cisco-iosxr-cli-7.65** NED.

![Select NED](../assets/images/_028.png)

Click on the ned-id **cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65**, then click **config**.

![Config](../assets/images/_029.png)

Set the NTP values: **Max-associations** (10) and **Peer Address** (1.1.1.1).

![NTP values](../assets/images/4_79.png)

Click the **Launchpad** icon (top right) to review your changes.

![Launchpad](../assets/images/4_80.png)

Confirm the changes and click **Commit**, then **Yes, commit**.

![Commit](../assets/images/4_81.png)
