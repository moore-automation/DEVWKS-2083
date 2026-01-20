# Cisco NSO Sandbox Compliance Lab Guide

## Introduction

This lab explores how to leverage Cisco Network Services Orchestrator (NSO) compliance reporting to audit network configurations using compliance templates. Compliance templates were first introduced in NSO 6.1, and this lab demonstrates the ongoing enhancements to compliance reporting using NSO 6.4.4.

This lab will walk you through several common compliance patterns, and remediation steps. You will learn how to translate policy requirements into NSO compliance templates and then how to create and run NSO compliance reports.

**Lab Objectives:**

1.   [Getting connected to the NSO Sandbox](#1-getting-connected-to-the-sandbox)
2.   [Get to know Cisco NSO](#2-get-to-know-cisco-nso)
3.   [Build NSO compliance templates](#3-build-nso-compliance-templates)
4.   [Generate compliance reports](#4-generate-compliance-reports)
5.   [Build remediation template](#5-build-remediation-template)
6.   [OPTIONAL Build compliance service](#6-optional-build-compliance-service)
7.   [OPTIONAL Remediate compliance service](#7-optional-remediate-compliance-service)


## 1. Getting connected to the Sandbox

1. Connect to the DevNet lab VPN using the provided address and credentials
2. View lab details at the following url: TBD
    - The NSO DevNet sandbox includes multiple instances of NSO, serveral devices types, and a seperate dev environment.
    - This lab will utilize a single instance of NSO and a single ios-xe router
4. Note the following details for use in this lab:
    | Lab Device | IP-Address | username | password |
    | --------------- | --------------- | --------------- | --------------- |
    | NSO Instance #1 | 10.10.20.47 | developer | C1sco12345 |
    | dist-rtr01 | 10.10.20.175 | cisco | cisco |

5. Next we will copy this repo to your laptop by running the following commands in the terminal application
    ```
    cd $HOME
    git clone --branch cisco-live-devwks-2656 --single-branch https://wwwin-github.cisco.com/cx-usps-auto/compliance-reporting-examples.git
    ```

## 2. Get to know Cisco NSO

The GUI interface:
1. Browse to http://10.10.20.47:8080
2. Login with the NSO credentials
3. Click the Devices panel
4. Select all devices and choose the action **Sync from** from the drop down menu

OPTIONAL:
5. Click the **dist-rtr01** device
6. Click the config panel
7. Explore the device configuration


The CLI interface:
1. From the terminal, ssh to NSO: 
    `ssh developer@10.10.20.47 -p 2024`
2. Convert to the Cisco style CLI
    `switch cli`
3. View the devices managed by Cisco NSO
    `show devices list`
4. Bring in the latest configuration of our test device
    `devices device dist-rtr01 sync-from`
5. View the local copy of the running configuration
    `show run devices device dist-rtr01 config`

## 3. Build NSO compliance templates

The following sections walk you through building multiple NSO compliance templates. You will cover several configuration patterns and practice using templates with tags to solve different compliance use cases. The instruction first provides a template for you to load directly into NSO configuration mode. Then show commands are listed to validate to configuration. 

### 3a. Template: LOGIN-POLICY

---

**The Compliance Requirement**: Ensure all login success and failures are logged by the network device. 
* CLI Configuration

    ```
    login on-failure log
    login on-success log
    ```
* Match Conditions: **exact, enabled, global**

**Creating the compliance template**:
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
            <name>LOGIN-POLICY</name>
            <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <login xmlns="urn:ios">
                <on-failure>
                    <log/>
                </on-failure>
                <on-success>
                    <log/>
                </on-success>
                </login>
            </config>
            </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. The resulting configuration:
    ```
    compliance template LOGIN-POLICY
     ned-id cisco-ios-cli-6.109
      config
       login on-failure log
       login on-success log
    ```
6. Commit the configuration
    `commit`

**Testing the compliance template** against our test device:
    `compliance template LOGIN-POLICY check device [ dist-rtr01 ]`


### 3b. Template: ENABLE-SECRET

---

**The Compliance Requirement**: Ensure an enable secret password is configured.
* CLI Configuration
    ```
    enable secret 9 $9$2lINZ5Wh4EmLhk$tcUOJ3T8ltIkcEcxvNocXozfrecRpUU0TnFWbJ/5R6A
    ```
* Match Conditions: **regex, enabled, global**

**Creating the compliance template** (inline cli approach):
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
            <name>ENABLE-SECRET</name>
            <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <enable xmlns="urn:ios">
                    <secret>
                        <type>9</type>
                        <secret>.+</secret>
                    </secret>
                </enable>
            </config>
            </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. The resulting configuration:
    ```
    compliance template ENABLE-SECRET
     ned-id cisco-ios-cli-6.109
      config
       enable secret 9
       enable secret .+
    ```
6. Commit the configuration
    `commit`

**Testing the compliance template** against our test device:
    `compliance template ENABLE-SECRET check device [ dist-rtr01 ]`


### 3c. Template: NO-ENABLE-PASSWORD

---

**The Compliance Requirement**: Ensure the enable password is not used. 
* CLI Configuration
    ```
    no enable password
    ```
* Match Conditions:
    **regex, absent, global**

**Creating the compliance template**:
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
            <name>NO-ENABLE-PASSWORD</name>
            <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <enable xmlns="urn:ios">
                    <password>
                        <secret tags=" absent ">.+</secret>
                    </password>
                </enable>
            </config>
            </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. The resulting configuration:
    ```
    compliance template NO-ENABLE-PASSWORD
     ned-id cisco-ios-cli-6.109
      config
       enable password 7
       ! Tags: absent
       enable password .+
    ```
6. Commit the configuration
    `commit`

**Testing the compliance template** against our test device:
    `compliance template NO-ENABLE-PASSWORD check device [ dist-rtr01 ]`


### 3d. Template: LOOPBACK0

---

**The Compliance Requirement**: Ensure loopback addresses are allocated in the correct network subnet.
* CLI Configuration
    ```
    interface Loopback 0
      ip address 10.0.100.10 255.255.255.255
    ```
* Match Conditions:
    **regex, enabled, nested**

**Creating the compliance template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
        <name>LOOPBACK0</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <interface xmlns="urn:ios">
                <Loopback>
                    <name>0</name>
                    <ip>
                    <address>
                        <primary>
                        <address>10.0.100.+</address>
                        <mask>255.255.255.255</mask>
                        </primary>
                    </address>
                    </ip>
                </Loopback>
                </interface>
            </config>
        </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

### 3e. Template: ROUTER-ID (part 1)

---

**The Compliance Requirement**: Ensure that the OSPF router-id is using a valid loopback IP.
* CLI Configuration
    ```
    router ospf 1
      router-id 10.0.100.10
    ```
* Match Conditions:
    **regex, enabled, nested**


**Creating the compliance template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
        <name>ROUTER-ID</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <router xmlns="urn:ios">
                <ospf>
                    <id>.+</id>
                    <router-id>10.0.100.+</router-id>
                </ospf>
                </router>
            </config>
        </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

### 3f. Template: ROUTER-ID (part 2)

---

**The Compliance Requirement**: Ensure that the OSPF and BGP router-id's are using a valid loopback IP.
* CLI Configuration
    ```
    router bgp 1
      bgp router-id 10.0.100.10
    ```
* Match Conditions:
    **regex, enabled, nested**

**Creating the compliance template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
        <name>ROUTER-ID</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <router xmlns="urn:ios">
                <ospf>
                    <id>.+</id>
                    <router-id>10.0.100.+</router-id>
                </ospf>
                <bgp tags=" allow-empty ">
                    <as-no>.+</as-no>
                    <bgp>
                    <router-id>10.0.100.+</router-id>
                    </bgp>
                </bgp>
                </router>
            </config>
        </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

### 3g. Template: NO-HTTP-SERVER

---

**The Compliance Requirement**: Ensure the HTTP and HTTPS servers is disables
* CLI Configuration
    ```
    no ip http server
    no ip http secure-server
    ```
* Match Conditions:
    **exact, disabled, global**

**Creating the compliance template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
        <name>NO-HTTP</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <ip xmlns="urn:ios">
                    <http>
                    <server>false</server>
                    <secure-server>false</secure-server>
                    </http>
                </ip>
            </config>
        </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

### 3h. Template: LINE-AUX

---

**The Compliance Requirement**: Ensure the line aux port is disables with a standard configuration
* CLI Configuration
    ```
    line aux 0
      no exec
      transport input none
      transport input none
    ```
* Match Conditions:
    **exact, disabled, block**


**Creating the compliance template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <template>
            <name>NO-AUX</name>
            <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                    <line xmlns="urn:ios">
                        <aux tags=" strict ">
                            <first>0</first>
                            <exec-choice>
                                <exec>false</exec>
                            </exec-choice>
                            <transport>
                                <input tags=" absent ">.+</input>
                                <output>none</output>
                            </transport>
                        </aux>
                    </line>
            </config>
            </ned-id>
        </template>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

## 4. Generate compliance reports

Note, the follow compliance report is composed of all previous compliance templates. To ensure all compliance templates are properly loaded, you may load merge all templates from the following file: [all-compliance-templates](devwks-templates/all-device-templates.xml)

From the NSO CLI:
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <reports>
        <report>
            <name>DevNet-2025</name>
            <device-check>
                <device>dist-rtr01</device>
                <template>
                    <name>ENABLE-SECRET</name>
                </template>
                <template>
                    <name>LOGIN-POLICY</name>
                </template>
                <template>
                    <name>LOOPBACK0</name>
                </template>
                <template>
                    <name>NO-AUX</name>
                </template>
                <template>
                    <name>NO-ENABLE-PASSWORD</name>
                </template>
                <template>
                    <name>NO-HTTP</name>
                </template>
                <template>
                    <name>ROUTER-ID</name>
                </template>
            </device-check>
        </report>
        </reports>
    </compliance>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

From the **NSO GUI** interface
1. Browse to http://10.10.20.47:8080
2. Login with NSO credendials
3. Click the **Tools** menu and select **Compliance reporting**
4. Select the report **DevNet-2025**
5. Next select **Run Report**
6. Choose a name **run1** and then follow the link to **Report results**
7. Explore your compliance results

##  5. Build remediation template

**Device templates** can be leveraged to push configurations to devices. They can be created natively in Cisco NSO. Here is an example device template to diable the HTTP service in 

**Creating the device template**: 
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <devices xmlns="http://tail-f.com/ns/ncs">
        <template>
            <name>NO-HTTP</name>
            <ned-id>
            <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">cisco-ios-cli-6.109:cisco-ios-cli-6.109</id>
            <config>
                <ip xmlns="urn:ios">
                <http>
                    <server>false</server>
                    <secure-server>false</secure-server>
                </http>
                </ip>
            </config>
            </ned-id>
        </template>
    </devices>
    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

**Device templates** are applied to devices or device-groups in NSO config mode. Follow the script below to apply this device template.

    ```
    config
    devices device dist-rtr01
    apply-template template-name NO-HTTP
    show config
    commit
    ```

Note: Due to NSO Fastmap, only new or updated configuration is sent to the device. 

Load the remainder of the device templates in order to remediate our compliance findings.
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the xml from the following file: [all-device-templates](devwks-templates/all-device-templates.xml)
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

Follow the script below to apply these device template.

    ```
    config
    devices device dist-rtr01
    apply-template template-name LOGIN-POLICY
    apply-template template-name LOOPBACK0 variable { name LOOPBACK0_IP value '10.0.100.10' }
    apply-template template-name ROUTER-ID variable { name LOOPBACK0_IP value '10.0.100.10' }
    apply-template template-name NO-AUX
    apply-template template-name ENABLE-SECRET
    apply-template template-name NO-ENABLE-PASSWORD
    show config
    commit dry-run outformat native
    commit
    ```
Next we can re-run the compliance report. From the **NSO GUI** interface
1. Browse to http://10.10.20.47:8080
2. Login with NSO credendials
3. Click the **Tools** menu and select **Compliance reporting**
4. Select the report **DevNet-2025**
5. Next select **Run Report**
6. Choose a name **run2** and then follow the link to **Report results**
7. Explore your compliance results


##  6. OPTIONAL: Build compliance service

1. Copy and load web-secure package into the Cisco NSO instance
    ```
    cd DevNet-Sandbox/nso-services
    scp web-secure.tar.gz developer@10.10.20.47:/nso/run/packages/
    ```
2. From the NSO CLI, restart packages: `packages reload`
3. From the NSO CLI, enter configuration mode: `config`
4. Type `load merge terminal` and paste the following:
    ```
    web-secure SECURE-WEB
    permitted-web-servers [ 192.168.10.100 192.168.10.101 192.168.19.102 ]
    devices dist-rtr01
      interface-type GigabitEthernet
      interface-id   2
    ```
5. Type `ctrl-d`
6. Preview the configuration
    `show configuration`
7. Type `commit`

##  7. OPTIONAL: Remediate compliance service

From the **NSO GUI** interface
1. Browse to http://10.10.20.47:8080
2. Login with NSO credendials
3. Click the **Tools** menu and select **Compliance reporting**
4. Select the previously created report **DevNet 2025**
5. Select the **Services** pane and select **Some services**
6. Add **/web-secure:web-secure** to the select service-type list
7. Scroll up and select **Save report**
8. Next select **Create Report**
9. Next select **Run report**
10. Choose a name **DevNet 2025-2** and then follow the link to **Report results**
11. Explore your compliance results

From the NSO CLI:
1. From the NSO CLI, enter configuration mode: `config`
2. Type `load merge terminal` and paste the following:
    ```
    <compliance xmlns="http://tail-f.com/ns/ncs">
        <reports>
        <report>
            <name>DevNet-2025</name>
            <service-check>
            <service-type>/web-secure:web-secure</service-type>
            </service-check>
        </report>
        </reports>
    </compliance>

    ```
3. Type `ctrl-d`
4. Preview the configuration
    `show configuration`
5. Type `commit`

From the **NSO GUI** interface
1. Browse to http://10.10.20.47:8080
2. Login with NSO credendials
3. Click the **Tools** menu and select **Compliance reporting**
4. Select the report **DevNet-2025**
5. Next select **Run Report**
6. Choose a name **run3** and then follow the link to **Report results**
7. Explore Services tab for compliance results for services