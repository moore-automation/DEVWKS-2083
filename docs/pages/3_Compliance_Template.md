In this task you will create a Compliance Template that defines the intended state of your network. NSO will later compare the live device configuration against this template to identify deviations.

Open the **Configuration Editor**.

![Configuration Editor](../assets/images/_004.png)

Select the **ncs:compliance** module.

![ncs:compliance](../assets/images/_005.png)

Click **Edit Config** (top bar), then click the **+** button.

![Edit Config](../assets/images/_006.png)

Name the template **ntp_check**.

![ntp_check](../assets/images/_007.png)

> **Candidate Config:** Green bars indicate changes are staged as a "candidate" configuration. They are not active until you click **Commit**.

Click on the **ntp_check** template and click the **+** button next to the template name.

![Add NED](../assets/images/_008.png)

> **NED (Network Element Driver):** Creates the Device Abstraction Layer in NSO, translating user intent to device-specific syntax (e.g. ASA, IOS, IOS-XR, NX-OS).

Select the NED **cisco-iosxr-cli-7.65** and click **Confirm**.

![Select NED](../assets/images/_009.png)

Click **config**, then **ntp** to navigate to the NTP path:

`ncs:compliance/template{ntp_check}/ned-id{cisco-iosxr-cli-7.65}/config/cisco-ios-xr:ntp/`

Configure the following:

**Max Associations:** 10

![Max Associations](../assets/images/_010.png)

**Peer Address:** 1.1.1.1

![Peer Address](../assets/images/4_90.png)

Click the **Launchpad** icon (top right) to review your changes.

![Launchpad](../assets/images/_011.png)

Click the **Config** tab to verify the staged configuration.

![Config tab](../assets/images/_012.png)

The green highlights show the configuration being checked.

Click **Commit**, then **Yes, commit**.

![Commit](../assets/images/4_91.png)

> **Note:** To check other device types, repeat this process by adding a different NED.
