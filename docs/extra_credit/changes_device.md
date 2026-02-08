
### 3 - Make changes in the device

> We will now delete the changes done by the service in the device.

Navigate to <b>Devices</b> and click on <b>dist-rtr01</b>

<small><img src="../assets/images/5_27.png"></small>

Navigate to the DNS configuration

<b>config</b> -> <b>ip</b> -> <b>name-server</b>

<small><img src="../assets/images/5_28.png"></small>

Click on <b>Edit config</b>, select the server address and hit <b>-</b> button

<small><img src="../assets/images/5_29.png"></small>

You should see 2 changes pending

<small><img src="../assets/images/5_30.png"></small>

We can notice the config diff. We're deleting the service config manually. Hit <b>Commit</b> and then <b>Yes, commit</b>

<small><img src="../assets/images/5_31.png"></small>
