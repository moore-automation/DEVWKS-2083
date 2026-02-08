This task demonstrates how easily non-compliant services can be remediated. You will re-run the compliance report, observe the failure, and remediate by re-deploying the service.

Go to **Tools** -> **Compliance Reports** and click the **...** menu (right side) to re-run the report. Click **Run**.

![Re-run report](../assets/images/5_32.png)

Name it **router_service_report_2** and click **Run report**.

![router_service_report_2](../assets/images/5_33.png)

The report now shows **Violations**.

![Violations](../assets/images/5_34.png)

Opening the report reveals why it is not compliant — the service is out-of-sync because the configuration was deleted manually.

![Out of sync](../assets/images/5_35.png)

Click **View details** to see exactly what is missing for the service to be in sync.

![View details](../assets/images/5_36.png)

> The key difference with service-based compliance: remediation is much faster and simpler — you just re-deploy the service. The trade-off is that compliance checks are limited to what the service defines.

To remediate, navigate to **Services** (left menu), open the **router_service** instance, click **Choose action**, then **Re-deploy**.

![Re-deploy](../assets/images/5_37.png)

> This action automatically pushes the missing configuration to the devices so the service is back in sync.

Click **Done**.

![Done](../assets/images/5_38.png)

Navigate back to **Compliance Reports** and run it one final time.

![Final run](../assets/images/5_39.png)

Name it **router_service_run_3** and click **Run report**.

![router_service_run_3](../assets/images/5_40.png)

You are now fully **Compliant**.

![Compliant](../assets/images/5_41.png)

![Report detail](../assets/images/5_42.png)

Thank you for completing the workshop! This guide can be revisited anytime using the [DevNet Sandbox](https://devnetsandbox.cisco.com/DevNet) — search for **Network Services Orchestrator 6.4.4**.

<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
  Built with love by Cisco CX Automation Team | Cisco Live 2026
</div>
