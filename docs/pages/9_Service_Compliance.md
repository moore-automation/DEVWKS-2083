In this task you will create a compliance report to validate the service configurations on the devices. Unlike template-based compliance, service compliance checks whether the device state matches the service definition.

In the left menu, go to **Tools** and open **Compliance Reports**.

![Compliance Reports](../assets/images/5_01.png)

Click **+New Report** and name it **router_service_report**. Click **Create**.

![New report](../assets/images/5_02.png)

Go to the **Services** tab. Select **Some services**, then choose the **r:router** service type.

![Select service](../assets/images/5_19.png)

Click **Add to list**.

![Add to list](../assets/images/5_20.png)

Click **Create Report** (top right).

![Create Report](../assets/images/5_21.png)

After you see **Saved changes successfully**, click **Run report**.

![Run report](../assets/images/5_22.png)

Name it **router_service_run** and click **Run report**.

![router_service_run](../assets/images/5_23.png)

Navigate to **Report results**.

![Report results](../assets/images/5_24.png)

The report is compliant because no changes were made on the device after the service was applied.

![Compliant](../assets/images/5_25.png)

Opening the report shows the detailed results.

![Report details](../assets/images/5_26.png)
