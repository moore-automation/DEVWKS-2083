
This task demonstrates how easily non-compliant reports can be remediated using services. We will now re-run the report, observe the failure, and remediate by re-deploying the service.

Go to <b>Tools</b> -> <b>Compliance reporting</b> and click on <b>...</b> (right side) to Re-Run the report. ( Hit <b>Run</b> )

<small><img src="../../assets/images/5_32.png"></small>

name it <b>router_service_report_2</b> and hit <b>Run report</b>

<small><img src="../../assets/images/5_33.png"></small>

We can now see that the report returned with <b>Violations</b>

<small><img src="../../assets/images/5_34.png"></small>

Entering the report we can see why the report is not compliant. Service is out-of-sync ( because we deleted the configuration )

<small><img src="../../assets/images/5_35.png"></small>

Clicking on <b>view details</b> you will be able to see what is missing for the service to be in sync.

<small><img src="../../assets/images/5_36.png"></small>

>The difference against compliance / device templates comes now, the remediation on services in much faster and simpler.
Comes with a cost, limitation on compliance capabilities, being only able to test if configuration is like defined in the service.

To Remediate, navigate to <b>Services</b> ( left side ), open the service instance <b>router_service</b> then, click on <b>Choose action</b> and then <b>Re-deploy</b>

<small><img src="../../assets/images/5_37.png"></small>

>This action will automatically push to the devices the changes missing in order the service to be in-sync

Click <b>Done</b>

<small><img src="../../assets/images/5_38.png"></small>

Let's go back to <b>Compliance Reports</b> and run it one final time

<small><img src="../../assets/images/5_39.png"></small>

Name it <b>router_service_run_3</b> and hit <b>Run report</b>

<small><img src="../../assets/images/5_40.png"></small>

We can now see that we're now fully <b>Compliant</b>.

<small><img src="../../assets/images/5_41.png"></small>

<small><img src="../../assets/images/5_42.png"></small>

Thank you so much !

This guide can be re-done anytime. You can access the lab instance in https://devnetsandbox.cisco.com/DevNet

In the search, you type "nso" and then choose <b>Network Services Orchestrator 6.4.4</b>


<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
  Built with ❤️ by Cisco CX Automation Team | Cisco Live 2026
</div>
