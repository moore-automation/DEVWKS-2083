# Building NSO Compliance Templates

**⏱️ Estimated time: 10 minutes**

In this section, you'll build multiple NSO compliance templates covering different patterns and use cases. Each exercise walks through a specific compliance requirement and shows you how to translate it into an NSO template.

---

## Overview

You'll create **8 compliance templates** covering various patterns:

| Template | Pattern Type | Complexity |
|----------|-------------|------------|
| LOGIN-POLICY | Exact + Enabled + Global | ⭐ Basic |
| ENABLE-SECRET | Regex + Enabled + Global | ⭐⭐ Intermediate |
| NO-ENABLE-PASSWORD | Regex + Absent + Global | ⭐⭐ Intermediate |
| LOOPBACK0 | Regex + Enabled + Nested | ⭐⭐⭐ Advanced |
| ROUTER-ID (Part 1) | Regex + Enabled + Nested | ⭐⭐⭐ Advanced |
| ROUTER-ID (Part 2) | Regex + Enabled + Multi-section | ⭐⭐⭐⭐ Expert |
| NO-HTTP | Exact + Disabled + Global | ⭐⭐ Intermediate |
| LINE-AUX | Exact + Disabled + Section | ⭐⭐⭐⭐ Expert |

!!! tip "Learning Approach"
    Each exercise follows the same pattern:
    1. Define the compliance requirement
    2. Identify the configuration pattern
    3. Create the template in NSO
    4. Test the template against devices

---

## Exercise 3a: LOGIN-POLICY Template

<span class="workshop-progress">Exercise 1 of 8</span>

### Compliance Requirement

**Policy:** Ensure all login success and failures are logged by the network device.

**Required Configuration:**
```cisco
login on-failure log
login on-success log
```

**Match Characteristics:**
- **Match Type:** Exact match
- **Match Logic:** Enabled feature
- **Match Pattern:** Global configuration

---

### Creating the Template

=== "CLI Method"

    **Step 1:** Enter NSO CLI configuration mode:
    ```bash
    developer@ncs# config
    ```

    **Step 2:** Load the template configuration:
    ```bash
    developer@ncs(config)# load merge terminal
    ```

    **Step 3:** Paste the following XML:
    ```xml
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

    **Step 4:** Press `Ctrl+D` to finish input

    **Step 5:** Preview the configuration:
    ```bash
    developer@ncs(config)# show configuration
    ```

    **Expected Output:**
    ```cisco
    compliance template LOGIN-POLICY
     ned-id cisco-ios-cli-6.109
      config
       login on-failure log
       login on-success log
    ```

    **Step 6:** Commit the configuration:
    ```bash
    developer@ncs(config)# commit
    developer@ncs(config)# exit
    ```

=== "Web UI Method"

    **Step 1:** Navigate to **Configuration** > **Compliance** > **Templates**

    **Step 2:** Click **Add** to create a new template

    **Step 3:** Enter template details:
    - Name: `LOGIN-POLICY`
    - NED ID: Select `cisco-ios-cli-6.109`

    **Step 4:** Configure the settings under the Config section

    **Step 5:** Click **Commit** to save

---

### Testing the Template

Test the template against the dist-rtr01 device:

```bash
developer@ncs# compliance template LOGIN-POLICY check device [ dist-rtr01 ]
```

**Expected Output:**
```
DEVICE      RESULT
-----------------------
dist-rtr01  compliant

or

dist-rtr01  violations
```

!!! success "Template Created!"
    You've created your first compliance template!

---

## Exercise 3b: ENABLE-SECRET Template

<span class="workshop-progress">Exercise 2 of 8</span>

### Compliance Requirement

**Policy:** Ensure an enable secret password is configured (using type 9 encryption).

**Required Configuration:**
```cisco
enable secret 9 $9$2lINZ5Wh4EmLhk$tcUOJ3T8ltIkcEcxvNocXozfrecRpUU0TnFWbJ/5R6A
```

**Match Characteristics:**
- **Match Type:** Regular expression (the secret can be any encrypted string)
- **Match Logic:** Enabled feature
- **Match Pattern:** Global configuration

---

### Creating the Template

**Step 1:** Enter configuration mode:
```bash
developer@ncs# config
```

**Step 2:** Load the template:
```bash
developer@ncs(config)# load merge terminal
```

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Press `Ctrl+D`, then commit:
```bash
developer@ncs(config)# show configuration
developer@ncs(config)# commit
developer@ncs(config)# exit
```

!!! info "Understanding Regex"
    The `.+` pattern means "one or more of any character" - this matches any encrypted secret string.

---

### Testing the Template

```bash
developer@ncs# compliance template ENABLE-SECRET check device [ dist-rtr01 ]
```

---

## Exercise 3c: NO-ENABLE-PASSWORD Template

<span class="workshop-progress">Exercise 3 of 8</span>

### Compliance Requirement

**Policy:** Ensure the insecure `enable password` command is NOT used (only `enable secret` should be configured).

**Required Configuration:**
```cisco
no enable password
```

**Match Characteristics:**
- **Match Type:** Regular expression
- **Match Logic:** **Absent** feature (must not exist)
- **Match Pattern:** Global configuration

---

### Creating the Template

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Commit the configuration

!!! warning "The 'absent' Tag"
    The `tags=" absent "` attribute tells NSO that this configuration should NOT exist on the device. This is different from checking if something is disabled.

---

### Testing the Template

```bash
developer@ncs# compliance template NO-ENABLE-PASSWORD check device [ dist-rtr01 ]
```

---

## Exercise 3d: LOOPBACK0 Template

<span class="workshop-progress">Exercise 4 of 8</span>

### Compliance Requirement

**Policy:** Ensure loopback addresses are allocated from the correct network subnet (10.0.100.0/24).

**Required Configuration:**
```cisco
interface Loopback0
  ip address 10.0.100.10 255.255.255.255
```

**Match Characteristics:**
- **Match Type:** Regular expression (IP can be any .1-.254 in subnet)
- **Match Logic:** Enabled feature
- **Match Pattern:** **Nested** configuration (under interface)

---

### Creating the Template

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Commit the configuration

!!! tip "Nested Configuration"
    Notice how the template specifies the parent context (`interface Loopback`) before checking the nested setting (`ip address`).

---

## Exercise 3e: ROUTER-ID Template (Part 1)

<span class="workshop-progress">Exercise 5 of 8</span>

### Compliance Requirement

**Policy:** Ensure that the OSPF router-id uses a valid loopback IP from the 10.0.100.0/24 subnet.

**Required Configuration:**
```cisco
router ospf 1
  router-id 10.0.100.10
```

**Match Characteristics:**
- **Match Type:** Regular expression (router-id from specific subnet)
- **Match Logic:** Enabled feature
- **Match Pattern:** Nested configuration

---

### Creating the Template

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Commit the configuration

!!! info "Regex in Router ID"
    The `<id>.+</id>` allows any OSPF process number, while `10.0.100.+` ensures the router-id is from the correct subnet.

---

## Exercise 3f: ROUTER-ID Template (Part 2)

<span class="workshop-progress">Exercise 6 of 8</span>

### Compliance Requirement

**Policy:** Extend the previous template to also check BGP router-id (ensuring both OSPF and BGP use valid loopback IPs).

**Required Configuration:**
```cisco
router ospf 1
  router-id 10.0.100.10
router bgp 65001
  bgp router-id 10.0.100.10
```

**Match Characteristics:**
- **Match Type:** Regular expression
- **Match Logic:** Enabled feature (with allow-empty for optional BGP)
- **Match Pattern:** Multiple nested sections

---

### Creating the Template

We'll **update** the existing ROUTER-ID template to include BGP.

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the **updated** XML:
```xml
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

**Step 4:** Commit the configuration

!!! warning "The 'allow-empty' Tag"
    The `tags=" allow-empty "` attribute means BGP configuration is optional. If BGP exists, it must have a valid router-id. If BGP doesn't exist, that's okay.

---

## Exercise 3g: NO-HTTP Template

<span class="workshop-progress">Exercise 7 of 8</span>

### Compliance Requirement

**Policy:** Ensure HTTP and HTTPS servers are disabled for security.

**Required Configuration:**
```cisco
no ip http server
no ip http secure-server
```

**Match Characteristics:**
- **Match Type:** Exact match
- **Match Logic:** **Disabled** feature (explicitly set to false)
- **Match Pattern:** Global configuration

---

### Creating the Template

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Commit the configuration

!!! info "Boolean Values"
    In NSO's XML representation, `<server>false</server>` means the server should be explicitly disabled (`no ip http server`).

---

## Exercise 3h: LINE-AUX Template

<span class="workshop-progress">Exercise 8 of 8</span>

### Compliance Requirement

**Policy:** Ensure the auxiliary line port is disabled with a standard security configuration.

**Required Configuration:**
```cisco
line aux 0
  no exec
  transport input none
  transport output none
```

**Match Characteristics:**
- **Match Type:** Exact match (with one absent check)
- **Match Logic:** Mix of disabled features and absent config
- **Match Pattern:** Configuration section with strict matching

---

### Creating the Template

**Step 1-2:** Enter config mode and load merge terminal

**Step 3:** Paste the XML:
```xml
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

**Step 4:** Commit the configuration

!!! warning "The 'strict' Tag"
    The `tags=" strict "` attribute means NSO checks that **only** the specified configuration exists under `line aux 0` - no additional commands should be present.

---

## Quick Load: All Templates at Once

If you want to load all templates quickly, you can use the pre-built file:

```bash
developer@ncs# config
developer@ncs(config)# load merge resources/devnet_sandbox/devwks_templates/all-compliance-templates.xml
developer@ncs(config)# commit
```

---

## Verify All Templates

Check that all templates were created successfully:

```bash
developer@ncs# show running-config compliance template
```

**Expected Output:**
```
compliance template ENABLE-SECRET
 ned-id cisco-ios-cli-6.109
  !
compliance template LINE-AUX
 ned-id cisco-ios-cli-6.109
  !
compliance template LOGIN-POLICY
 ned-id cisco-ios-cli-6.109
  !
...
```

---

## Test Individual Templates

You can test any template against a device:

```bash
# Test a single template
developer@ncs# compliance template LOGIN-POLICY check device [ dist-rtr01 ]

# Test multiple templates
developer@ncs# compliance template LOGIN-POLICY check device [ dist-rtr01 dist-sw01 ]
```

---

## Summary

Congratulations! You've created **8 compliance templates** covering:

- ✅ Exact match patterns
- ✅ Regular expression patterns
- ✅ Variable substitution
- ✅ Enabled features
- ✅ Disabled features
- ✅ Absent configuration
- ✅ Global configuration
- ✅ Nested configuration
- ✅ Configuration sections
- ✅ Special tags (absent, allow-empty, strict)

<div class="img-placeholder">
📸 Image Placeholder: Template Creation Success
<br><small>Suggested: Screenshot showing list of created compliance templates in NSO</small>
</div>

---

## Next Steps

Now that you have compliance templates, let's create a comprehensive compliance report and run it against your devices!

[Continue to Generating Compliance Reports →](compliance-reports.md){ .md-button .md-button--primary }
[Back to Getting Started →](getting-started.md){ .md-button }
