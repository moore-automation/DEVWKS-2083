# DEVWKS-2083 - The Journey of Automating Network Compliance using Cisco NSO

<div class="img-placeholder">
<br><small><img src="assets/images/banner.png"></small>
</div>

## Welcome to the Workshop!

- Be Sure VPN Connectivity is ON.

- Open the Browser and navigate to NSO IP
http://10.10.20.47:8080/

username : admin
password : admin

## 1 - Devices in-sync

Ensure devices are in sync with NSO

Go to the devices list

<small><img src="assets/images/1_001.png"></small>

select all

<small><img src="assets/images/1_002.png"></small>

do a sync from

<small><img src="assets/images/1_003.png"></small>

all devices are now in sync, click "Done"

### 2 - Create the Compliance Template

To Create our first Compliance Report

Go to the Configuration Editor

<small><img src="assets/images/3_001.png"></small>

Select ncs:compliance

<small><img src="assets/images/3_002.png"></small>

Click on "Edit Config" button on Top and then click on the "+" Button to Create your first Compliance Template

<small><img src="assets/images/3_003.png"></small>

Add a new item called "ntp_check"

<small><img src="assets/images/4_60.png"></small>

You can notice the greenbar's on the left, this means the configuration is seen as candidate. If it was a device configuration, it would only be pushed after we click on the Commit button.

Click on "ntp_check" template that you just created and then hit the "+" button.

<small><img src="assets/images/4_61.png"></small>

NED - Network Element Driver, creates de Device Abstraction Layer in NSO. Translating the User intent to the device specific language.

You now need to select the device types you're targetting with the compliance check.

In this case we've 4 available.
ASA
IOS
IOSXR
NX

Select "cisco-iosxr-cli-7.65" and hit "confirm"

<small><img src="assets/images/4_62.png"></small>

Now, we will define what will be checked for IOS-XR devices.

Click on the ned name "cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65" and then "config"

We're now in the root of the NED ( device ). 
The goal is to select what configurations we will audit.
Let's grab a simple use case.
NTP Peer and Max-Associations configured.

Navigate to the ntp path.

/ncs:compliance/template{ntp_check}/ned-id{cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65}/config/cisco-ios-xr:ntp/

Fill some of the elements, like Max Associations.

<small><img src="assets/images/4_63.png"></small>

and then Peer Address

<small><img src="assets/images/4_007.png"></small>

Now that we did finish our Compliance Template, let's go to "Commit Manager" to overview the changes.

Click on the top right launchpad icon

<small><img src="assets/images/4_64.png"></small>

and then, click on the "config" tab.

<small><img src="assets/images/4_65.png"></small>

We can see, in green, what is the config we are checking.

Click, on the commit button ( on the right ) and then , on the popup, click under "Yes, commit" Button

<small><img src="assets/images/4_13.png"></small>

We're now ready to create and run our Compliance Report.

Note : If we wish to make checks on other types of devices we just need to repeat the same process, by adding a different type of NED.


### 2 - Create the Compliance Report ( Auditing )

Navigate to Tools -> Compliance Reports

<br><small><img src="assets/images/001.png"></small>

The List should be empty. Let's create our first Compliance Report.

Click on the "+ New report" button ( right side ).

<br><small><img src="assets/images/002.png"></small>

Give the compliance report name, in this case "ntp_report" and hit the "Create" button

<small><img src="assets/images/4_66.png"></small>

Click on "Devices" tab and select "All devices"

<small><img src="assets/images/4_67.png"></small>

Scroll Down, to the Compliances Report. Click on "Add Template" Button

<small><img src="assets/images/4_16.png"></small>

Select the "ntp_check" Template we've created.

<small><img src="assets/images/4_68.png"></small>

Scroll Up and hit the "Create Report" button. Your page should look like this.

<small><img src="assets/images/4_69.png"></small>

Your Report is ready to run. Click on "Run Report" button.

<small><img src="assets/images/4_19.png"></small>

Give a name like "ntp_run" - This will allow you to identify the report execution when you run a report multiple times.

Click on "Run Report" button.

<small><img src="assets/images/4_70.png"></small>

Once it finishes, a pop-up shuld show up on the top right of your page. Click on "Report results" hyperlink.

<small><img src="assets/images/4_71.png"></small>

If you miss the popup time, use the left menu option "Tools" -> "Report results"

Your window should show up like this.

We can notice we've some violations.

Click on the report execution name "ntp_run" to see the details.

<small><img src="assets/images/4_72.png"></small>

Looking at the result, we can see our network of 9 devices is 78% compliant. 

Only 2 devices are not compliant.

<small><img src="assets/images/4_74.png"></small>

By clicking on "View details" next to "Not Compliant" device. We can see what configurations are missing in the device, to make it not compliant.

<small><img src="assets/images/4_75.png"></small>

Now, there are 2 ways to Remediate.

1 - If we're testing the Compliance Report agaisnt an NSO Service, we can just click on "Re-Deploy" action button and the Devices will be automatically compliant.

2 - Since we're testing the Compliance Report agaisnt a Compliance Template, we will create a Device Template and Apply to the Devices.

There is always a third option, which is, inserting the configurations in the device manually, but, we were going the automation path. In this use case, might be just some couple of lines, but following a true compliance check might result in multiple different types of missing configurations across devices.

### 3 - Create a Device Template ( Remediation )

Now we will follow a similar procedure regarding compliance templates.

Double-click on "Config Editor" located on the left menu. 

Select the "ncs:devices" module

<small><img src="assets/images/4_25.png"></small>

Click on Edit-Config

<small><img src="assets/images/4_26.png"></small>

on Template, click on "plus" button.

<small><img src="assets/images/4_28.png"></small>

Add a new list item named "vtp_ntp_remediation" and hit "confirm"

<small><img src="assets/images/4_27.png"></small>

Click on it

<small><img src="assets/images/4_29.png"></small>

Select the IOS-XR NED-ID and hit "confirm"

<small><img src="assets/images/4_30.png"></small>

Click on the ned-id "cisco-iosxr-cli-7.65:cisco-iosxr-cli-7.65" to create the remediation configurations.

<small><img src="assets/images/4_31.png"></small>

First, the VTP

<small><img src="assets/images/4_32.png"></small>

Then, NTP "max-associations" ( 10 ) and "peer" "address" ( 1.1.1.1 )

<small><img src="assets/images/4_33.png"></small>

To finish, "server address" ( 2.2.2.2 )

<small><img src="assets/images/4_34.png"></small>

Defining the minpool ( 8 ) and maxpool ( 12 ) values, inside the server address.

<small><img src="assets/images/4_35.png"></small>

After finishing our remediation template. We will click on our launchpad ( top right ) to commit the changes.

<small><img src="assets/images/4_36.png"></small>

We can confirm the changes and hit "Commit" and then "Yes, commit"

<small><img src="assets/images/4_37.png"></small>

### 4 - Apply the Remediation Template

To apply the template, we go to "Devices" menu. 
Select the devices we want to apply the template.
Then, "Choose actions" and then "Apply template"

<small><img src="assets/images/4_38.png"></small>

We select the template and hit "Apply"

<small><img src="assets/images/4_39.png"></small>

We should see "result ok" message. Then hit, "Done"

<small><img src="assets/images/4_40.png"></small>

Taking a look at our launchpad ( top right ). We see that we now have 14 changes pending.

<small><img src="assets/images/4_41.png"></small>

We can see that NSO will automatically apply the changes from the template to the devices.

NSO is smart and will only apply the needed changes, for example, if one device already had "max-associations" configured, NSO would skip that lines from the template for that device.

<small><img src="assets/images/4_42.png"></small>

We now, click on "Commit" and then "Yes, commit". You should see the message, "Commit finished...roolback id..."

This another great advantage of NSO. every change can be reverted, easily.

<small><img src="assets/images/4_43.png"></small>

### 5 - Re-run the Report

Go to "Tools" -> "Compliance reports"
Click on the "..." on the right of the screen ( report line )

<small><img src="assets/images/4_44.png"></small>

Click on "Run Report"

<small><img src="assets/images/4_45.png"></small>

Give it a name, like "ntp_run_2" and hit "Run report"

<small><img src="assets/images/4_46.png"></small>

Let's see the "Report Results"

<small><img src="assets/images/4_47.png"></small>

You can see that we're now with "No violation", which by other words mean "Compliant"

<small><img src="assets/images/4_48.png"></small>

Opening the Report we can see that we're full compliant.

<small><img src="assets/images/4_49.png"></small>

There is as well the option to export the reports to PDF formats so they can be leveraged for internal usage.

Thank you so much !

<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
  Built with ❤️ by Cisco CX Automation Team | Cisco Live 2026
</div>
