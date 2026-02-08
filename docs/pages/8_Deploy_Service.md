To automate configuration deployment in NSO, you develop a service. These services can also support compliance activities. In this task you will deploy a pre-built service to a device.

### Deploy the Service

In the left menu, click **Services** and select the **r:router** pre-built service.

![Services](../assets/images/5_03.png)

Click **+ Add service** on the right side.

![Add service](../assets/images/5_04.png)

Click the **+** button to add a new entry to the list.

![New entry](../assets/images/5_05.png)

Name it **router_service** and click **Confirm**.

![router_service](../assets/images/5_06.png)

Click on the **router_service** instance you just created.

![Select instance](../assets/images/5_07.png)

Click the **+** button to select the devices that will use this service.

![Add device](../assets/images/5_08.png)

Select **dist-rtr01** and click **Confirm**.

![dist-rtr01](../assets/images/5_09.png)

> To apply the same configuration to additional devices, repeat the process and select more devices.

![Device added](../assets/images/5_10.png)

Click **sys** to define the configurations to apply.

![sys](../assets/images/5_11.png)

Click **dns**.

![dns](../assets/images/5_12.png)

Add an NTP **server** configuration by clicking the **+** button.

![Add server](../assets/images/5_13.png)

Enter an address like **1.2.3.4** and click **Confirm**.

![Address](../assets/images/5_15.png)

You should see the number **3** near the **Launchpad** icon (top right), indicating pending changes. Click on it.

![Launchpad](../assets/images/5_16.png)

Select the **Config** tab to see the configuration diff — what will be sent to the device and saved in the NSO CDB.

![Config diff](../assets/images/5_17.png)

Click **Commit**, then **Yes, commit**.

![Commit](../assets/images/5_18.png)

> If you selected multiple devices, the same configuration will be sent to all of them in a single transaction.
