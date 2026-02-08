Before performing an audit, NSO must have the latest configuration from the network (the "Source of Truth"). Therefore, during this task, we will execute the "sync-from" action, which pulls the configurations from the devices and saves them in the Configuration Database (CDB).

##### Steps:

Navigate to the <b>Devices</b> list in the main menu

<small><img src="../../assets/images/_001.png"></small>

<b>Select all</b> devices.

<small><img src="../../assets/images/_002.png"></small>

Click the <b>Choose actions</b> dropdown and select <b>Sync From</b>. This pulls the device configurations into the NSO CDB (Configuration Database).

<small><img src="../../assets/images/_003.png"></small>

Once the sync is complete, click <b>Done</b>.
