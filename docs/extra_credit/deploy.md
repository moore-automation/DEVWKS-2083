To automate configuration deployment in NSO, you need to develop a service. These services can also support compliance activities. During this task, we will deploy the service on a device.

### 1 - Deploy the Service

Using the Left Menu Click on <b>Services</b> and select the <b>r:router</b> pre-built service.

<small><img src="../../assets/images/5_03.png"></small>

Click on <b>+ Add service</b> located on the right side.

<small><img src="../../assets/images/5_04.png"></small>

Then, click on <b>+</b> button to add a new entry to the list

<small><img src="../../assets/images/5_05.png"></small>

Name it <b>router_service</b> and hit <b>confirm</b>

<small><img src="../../assets/images/5_06.png"></small>

Click on <b>router_service</b> created instance

<small><img src="../../assets/images/5_07.png"></small>

Click on the <b>+</b> button to select the devices that will be <b>affected</b> by the service creation.

<small><img src="../../assets/images/5_08.png"></small>

Pick <b>dist-rtr01</b> and hit <b>confirm</b>

<small><img src="../../assets/images/5_09.png"></small>

> If you wish to apply the same configuration to other devices repeat the same process and select more devices.

<small><img src="../../assets/images/5_10.png"></small>

Click on <b>sys</b> to define the configurations to apply

<small><img src="../../assets/images/5_11.png"></small>

Click on <b>dns</b>

<small><img src="../../assets/images/5_12.png"></small>

Add a ntp <b>server</b> configuration by click on <b>+</b> button

<small><img src="../../assets/images/5_13.png"></small>

Enter an address like <b>1.2.3.4</b> and hit <b>confirm</b>

<small><img src="../../assets/images/5_15.png"></small>

Your page should look like this. You an notice the number 3 near the <b>launchpad</b> ( top right ). click on it.

<small><img src="../../assets/images/5_16.png"></small>

If you select the config tab you will be able to see the config difference. What will be sent to the device, and what will be saved on NSO CDB regarding device and service configurations.

<small><img src="../../assets/images/5_17.png"></small>

Hit Commit and then <b>Yes, commit</b>

<small><img src="../../assets/images/5_18.png"></small>

>In case you've selected more devices, the same configuration will be sent to them as well in the same transaction.