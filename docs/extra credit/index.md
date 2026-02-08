## Part II ( Optional ) - Compliance using Services

>To deploy configurations more automatically in NSO, you need to develop a service. These services can also be used for compliance purposes.

### 1 - Deploy the Service

Using the Left Menu Click on <b>Services</b> and select the <b>r:router</b> pre-built service.

<small><img src="assets/images/5_03.png"></small>

Click on <b>+ Add service</b> located on the right side.

<small><img src="assets/images/5_04.png"></small>

Then, click on <b>+</b> button to add a new entry to the list

<small><img src="assets/images/5_05.png"></small>

Name it <b>router_service</b> and hit <b>confirm</b>

<small><img src="assets/images/5_06.png"></small>

Click on <b>router_service</b> created instance

<small><img src="assets/images/5_07.png"></small>

Click on the <b>+</b> button to select the devices that will be <b>affected</b> by the service creation.

<small><img src="assets/images/5_08.png"></small>

Pick <b>dist-rtr01</b> and hit <b>confirm</b>

<small><img src="assets/images/5_09.png"></small>

> If you wish to apply the same configuration to other devices repeat the same process and select more devices.

<small><img src="assets/images/5_10.png"></small>

Click on <b>sys</b> to define the configurations to apply

<small><img src="assets/images/5_11.png"></small>

Click on <b>dns</b>

<small><img src="assets/images/5_12.png"></small>

Add a ntp <b>server</b> configuration by click on <b>+</b> button

<small><img src="assets/images/5_13.png"></small>

Enter an address like <b>1.2.3.4</b> and hit <b>confirm</b>

<small><img src="assets/images/5_15.png"></small>

Your page should look like this. You an notice the number 3 near the <b>launchpad</b> ( top right ). click on it.

<small><img src="assets/images/5_16.png"></small>

If you select the config tab you will be able to see the config difference. What will be sent to the device, and what will be saved on NSO CDB regarding device and service configurations.

<small><img src="assets/images/5_17.png"></small>

Hit Commit and then <b>Yes, commit</b>

<small><img src="assets/images/5_18.png"></small>

>In case you've selected more devices, the same configuration will be sent to them as well in the same transaction.

### 2 - Create the Compliance Report 

Using the Left Menu <b>"Tools"</b>, Open "Compliance Reports"

<small><img src="assets/images/5_01.png"></small>

Click on <b>+New Report</b> button and name it <b>router_service_report</b>. Hit the Create Button.

<small><img src="assets/images/5_02.png"></small>

Go to the <b>Services</b> tab. Select <b>Some services</b> and then <b>r:router</b> service type.

<small><img src="assets/images/5_19.png"></small>

<b>Add to list</b>

<small><img src="assets/images/5_20.png"></small>

Now, <b>Create Report</b> ( top right )

<small><img src="assets/images/5_21.png"></small>

After <b>Saved changes successfully</b>, "Run report"

<small><img src="assets/images/5_22.png"></small>

Name it <b>router_Service_run</b> and hit <b>Run report</b>

<small><img src="assets/images/5_23.png"></small>

Report results

<small><img src="assets/images/5_24.png"></small>

We can see our Report is compliant, due to no changes in the device after the service aplication. 

<small><img src="assets/images/5_25.png"></small>

Opening the report you can see the results.

<small><img src="assets/images/5_26.png"></small>

### 3 - Make changes in the device

> We will now delete the changes done by the service in the device.

Navigate to <b>Devices</b> and click on <b>dist-rtr01</b>

<small><img src="assets/images/5_27.png"></small>

Navigate to the DNS configuration

<b>config</b> -> <b>ip</b> -> <b>name-server</b>

<small><img src="assets/images/5_28.png"></small>

Click on <b>Edit config</b>, select the server address and hit <b>-</b> button

<small><img src="assets/images/5_29.png"></small>

You should see 2 changes pending

<small><img src="assets/images/5_30.png"></small>

We can notice the config diff. We're deleting the service config manually. Hit <b>Commit</b> and then <b>Yes, commit</b>

<small><img src="assets/images/5_31.png"></small>

### 4 - Re-run the Report and Remediate

Go to <b>Tools</b> -> <b>Compliance reporting</b> and click on <b>...</b> (right side) to Re-Run the report. ( Hit <b>Run</b> )

<small><img src="assets/images/5_32.png"></small>

name it <b>router_service_report_2</b> and hit <b>Run report</b>

<small><img src="assets/images/5_33.png"></small>

We can now see that the report returned with <b>Violations</b>

<small><img src="assets/images/5_34.png"></small>

Entering the report we can see why the report is not compliant. Service is out-of-sync ( because we deleted the configuration )

<small><img src="assets/images/5_35.png"></small>

Clicking on <b>view details</b> you will be able to see what is missing for the service to be in sync.

<small><img src="assets/images/5_36.png"></small>

>The difference against compliance / device templates comes now, the remediation on services in much faster and simpler.
Comes with a cost, limitation on compliance capabilities, being only able to test if configuration is like defined in the service.

To Remediate, navigate to <b>Services</b> ( left side ), open the service instance <b>router_service</b> then, click on <b>Choose action</b> and then <b>Re-deploy</b>

<small><img src="assets/images/5_37.png"></small>

>This action will automatically push to the devices the changes missing in order the service to be in-sync

Click <b>Done</b>

<small><img src="assets/images/5_38.png"></small>

Let's go back to <b>Compliance Reports</b> and run it one final time

<small><img src="assets/images/5_39.png"></small>

Name it <b>router_service_run_3</b> and hit <b>Run report</b>

<small><img src="assets/images/5_40.png"></small>

We can now see that we're now fully <b>Compliant</b>.

<small><img src="assets/images/5_41.png"></small>

<small><img src="assets/images/5_42.png"></small>

Thank you so much !

This guide can be re-done anytime. You can access the lab instance in https://devnetsandbox.cisco.com/DevNet

In the search, you type "nso" and then choose <b>Network Services Orchestrator 6.4.4</b>



<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
  Built with ❤️ by Cisco CX Automation Team | Cisco Live 2026
</div>
