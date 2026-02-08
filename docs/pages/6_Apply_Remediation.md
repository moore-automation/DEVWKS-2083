You are now applying the remediation template to the non-compliant devices.

Navigate to the **Devices** menu. Select the devices you want to apply the template to, then click **Choose actions** and select **Apply template**.

![Apply template](../assets/images/_030.png)

Select the template and click **Apply**.

![Select and apply](../assets/images/4_82.png)

You should see a **result ok** message. Click **Done**.

![Result ok](../assets/images/_031.png)

Check the **Launchpad** (top right) — you should see 6 changes pending.

![Pending changes](../assets/images/4_83.png)

NSO will automatically apply the changes from the template to the devices.

> NSO is smart and will only apply the needed changes. For example, if a device already had "max-associations" configured, NSO would skip those lines from the template for that device.

![Changes detail](../assets/images/4_84.png)

Click **Commit**, then **Yes, commit**. You should see the message "Commit finished...rollback id..."

This is another great advantage of NSO — every change can be reverted easily.

![Commit complete](../assets/images/_032.png)
