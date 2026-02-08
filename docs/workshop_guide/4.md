Since we are not compliant, we will create a device template to apply remediation to all non-compliant devices.

Double-click on <b>"Config Editor"</b> located on the left menu. 

Select the <b>"ncs:devices"</b> module

<small><img src="../../assets/images/_025.png"></small>

Click <b>Edit-Config</b>

<small><img src="../../assets/images/4_76.png"></small>

<b>Template</b> -> <b>+ (Plus)</b>.

<small><img src="../../assets/images/_027.png"></small>

Name it ntp_remediation and click <b>Confirm</b>.

<small><img src="../../assets/images/4_77.png"></small>

Click on it

<small><img src="../../assets/images/4_78.png"></small>

Select the cisco-iosxr-cli-7.65 NED.

<small><img src="../../assets/images/_028.png"></small>

Click on the ned-id "cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65" to create the remediation configurations. Then "config".

<small><img src="../../assets/images/_029.png"></small>

Set the NTP values: <b>Max-associations</b> (10) and <b>Peer Address</b> (1.1.1.1).

<small><img src="../../assets/images/4_79.png"></small>

After finishing our remediation template. We will click on our <b>launchpad ( top right )</b> to commit the changes.

<small><img src="../../assets/images/4_80.png"></small>

We can confirm the changes and hit <b>"Commit"</b> and then "Yes, commit"

<small><img src="../../assets/images/4_81.png"></small>
