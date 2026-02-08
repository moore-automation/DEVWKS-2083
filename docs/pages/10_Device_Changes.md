To demonstrate how service compliance detects configuration drift, you will manually remove the changes made by the service on a device. This will generate a non-compliant report in the next step.

Navigate to **Devices** and click on **dist-rtr01**.

![dist-rtr01](../assets/images/5_27.png)

Navigate to the DNS configuration: **config** -> **ip** -> **name-server**.

![DNS config](../assets/images/5_28.png)

Click **Edit config**, select the server address, and click the **-** button to remove it.

![Remove server](../assets/images/5_29.png)

You should see 2 changes pending in the Launchpad.

![Pending changes](../assets/images/5_30.png)

The config diff shows you are deleting the service configuration manually. Click **Commit**, then **Yes, commit**.

![Commit](../assets/images/5_31.png)
