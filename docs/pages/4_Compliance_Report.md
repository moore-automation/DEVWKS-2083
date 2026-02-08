Now you will compare the current network state against the **ntp_check** template to determine whether devices are compliant or require remediation.

Go to **Tools** -> **Compliance Reports**.

![Compliance Reports](../assets/images/_013.png)

Click **+ New report**.

![New report](../assets/images/_014.png)

Name it **ntp_report** and click **Create**.

![ntp_report](../assets/images/_015.png)

In the **Devices** tab, select **All devices**.

![All devices](../assets/images/_016.png)

Scroll to **Compliances** and click **Add Template**.

![Add Template](../assets/images/_017.png)

Select the **ntp_check** template you created earlier.

![Select template](../assets/images/_018.png)

Scroll up and click **Create Report**. Verify the report name and template are listed correctly.

![Create Report](../assets/images/_019.png)

Your report is ready to run. Click **Save Report**.

![Save Report](../assets/images/_020.png)

Name the run **ntp_run** and click **Run report**.

![Run report](../assets/images/_021.png)

Click the **Report results** link in the pop-up, or find it under **Tools -> Report results**.

![Report results](../assets/images/_022.png)

You can see there are some violations. Click on the report execution **ntp_run** to see the details.

![Violations](../assets/images/_023.png)

The result shows your network of 9 devices is 78% compliant — only 2 devices are not compliant.

![78% compliant](../assets/images/_024.png)

Click **View details** on a non-compliant device to see exactly what configuration is missing.

![View details](../assets/images/_026.png)

> There are two ways to remediate:
>
> 1. If you are testing against an **NSO Service**, you can click the **Re-Deploy** action and devices will automatically become compliant.
>
> 2. Since you are testing against a **Compliance Template**, you will create a Device Template and apply it to the devices.
>
> There is always a third option — inserting configurations manually — but the automation path is far more scalable, especially when a compliance check reveals missing configurations across many devices.
