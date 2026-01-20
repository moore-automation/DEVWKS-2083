# Complete Template Library

This page provides the complete XML source code for all compliance templates included in the workshop. Templates are organized by category for easy reference.

!!! tip "Using These Templates"
    You can copy and paste these templates directly into NSO using:
    ```bash
    config
    load merge terminal
    <paste XML>
    Ctrl+D
    commit
    ```

---

## Security Baseline Templates

Templates that enforce fundamental security requirements.

### LOGIN-POLICY

**Purpose:** Ensure login successes and failures are logged for audit purposes.

**Pattern:** Exact + Enabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>LOGIN-POLICY</name>
        <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
login on-failure log
login on-success log
```

**Download:** [login-policy.xml](../../resources/devnet_sandbox/devwks_templates/login-policy.xml)

---

### ENABLE-SECRET

**Purpose:** Ensure enable secret is configured with strong encryption (type 9).

**Pattern:** Regex + Enabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>ENABLE-SECRET</name>
        <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
enable secret 9 <encrypted-string>
```

**Download:** [enable-secret.xml](../../resources/devnet_sandbox/devwks_templates/enable-secret.xml)

---

### NO-ENABLE-PASSWORD

**Purpose:** Ensure the insecure enable password command is not used.

**Pattern:** Regex + Absent + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>NO-ENABLE-PASSWORD</name>
        <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
# Enable password command must NOT exist
```

**Download:** [no-enable-password.xml](../../resources/devnet_sandbox/devwks_templates/no-enable-password.xml)

---

### service-encrypt

**Purpose:** Ensure password encryption service is enabled.

**Pattern:** Exact + Enabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>service-encrypt</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <service xmlns="urn:ios">
                    <password-encryption/>
                </service>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
service password-encryption
```

**Download:** [service_encrypt.xml](../../resources/compliance_templates/service_encrypt.xml)

---

### NO-HTTP

**Purpose:** Ensure HTTP and HTTPS servers are disabled.

**Pattern:** Exact + Disabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
    <name>NO-HTTP</name>
    <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
no ip http server
no ip http secure-server
```

**Download:** [no-http-server.xml](../../resources/devnet_sandbox/devwks_templates/no-http-server.xml)

---

### service-small-servers

**Purpose:** Ensure legacy TCP/UDP small servers are not enabled.

**Pattern:** Exact + Absent + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>service-small-servers</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <service xmlns="urn:ios">
                    <udp-small-servers tags=" absent ">true</udp-small-servers>
                    <tcp-small-servers tags=" absent ">true</tcp-small-servers>
                </service>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
# These commands must NOT exist:
# service tcp-small-servers
# service udp-small-servers
```

**Download:** [service_small_servers.xml](../../resources/compliance_templates/service_small_servers.xml)

---

### NO-AUX

**Purpose:** Ensure auxiliary line port is disabled with secure configuration.

**Pattern:** Exact + Disabled + Section (Strict)

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>NO-AUX</name>
        <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
line aux 0
  no exec
  transport output none
```

**Download:** [line-aux.xml](../../resources/devnet_sandbox/devwks_templates/line-aux.xml)

---

## Network Infrastructure Templates

Templates for operational standards and network configuration.

### LOOPBACK0

**Purpose:** Ensure loopback addresses are from the management subnet.

**Pattern:** Regex + Enabled + Nested

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
      <name>LOOPBACK0</name>
      <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
interface Loopback0
  ip address 10.0.100.X 255.255.255.255
```

**Download:** [loopback0.xml](../../resources/devnet_sandbox/devwks_templates/loopback0.xml)

---

### ROUTER-ID

**Purpose:** Ensure OSPF and BGP router-ids use loopback IPs.

**Pattern:** Regex + Enabled + Multi-section

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
      <name>ROUTER-ID</name>
      <ned-id>
        <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
            cisco-ios-cli-6.109:cisco-ios-cli-6.109
        </id>
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

**CLI Equivalent:**
```cisco
router ospf 1
  router-id 10.0.100.X
router bgp 65001
  bgp router-id 10.0.100.X
```

**Download:** [router-id.xml](../../resources/devnet_sandbox/devwks_templates/router-id.xml)

---

### interface_unreachables

**Purpose:** Ensure ICMP unreachables are disabled on interfaces.

**Pattern:** Regex + Disabled + Nested

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>interface_unreachables</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <interface xmlns="urn:ios">
                    <GigabitEthernet tags=" allow-empty ">
                        <name>.*</name>
                        <ip>
                            <unreachables>false</unreachables>
                        </ip>
                    </GigabitEthernet>
                    <TenGigabitEthernet tags=" allow-empty ">
                        <name>.*</name>
                        <ip>
                            <unreachables>false</unreachables>
                        </ip>
                    </TenGigabitEthernet>
                </interface>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
interface GigabitEthernet0/0
  no ip unreachables
```

**Download:** [interface_unreachables.xml](../../resources/compliance_templates/interface_unreachables.xml)

---

## Operational Standards Templates

Templates for configuration consistency and management.

### timezone

**Purpose:** Ensure timezone is configured consistently (supports IOS and IOS-XR).

**Pattern:** Variable + Enabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>timezone</name>
        <!-- IOS-XR NED -->
        <ned-id>
            <id xmlns:cisco-iosxr-cli-7.61="http://tail-f.com/ns/ned-id/cisco-iosxr-cli-7.61">
                cisco-iosxr-cli-7.61:cisco-iosxr-cli-7.61
            </id>       
            <config>
                <clock xmlns="http://tail-f.com/ned/cisco-ios-xr">
                    <timezone>
                    <zone>{$TIMEZONE}</zone>
                    <hours-offset>{$OFFSET_HOURS}</hours-offset>
                    <minutes-offset>{$OFFSET_MINUTES}</minutes-offset>
                    </timezone>
                </clock>
            </config>
        </ned-id>
        <!-- IOS NED -->
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>     
            <config>
                <clock xmlns="urn:ios">
                    <timezone>
                    <zone>{$TIMEZONE}</zone>
                    <hours>{$OFFSET_HOURS}</hours>
                    <minutes>{$OFFSET_MINUTES}</minutes>
                    </timezone>
                </clock>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
clock timezone EST -5 0
```

**Variables Required:**
- `$TIMEZONE` - Timezone name (e.g., EST, PST, UTC)
- `$OFFSET_HOURS` - Hours offset from UTC
- `$OFFSET_MINUTES` - Minutes offset

**Download:** [timezone.xml](../../resources/compliance_templates/timezone.xml)

---

### line_console_strict

**Purpose:** Ensure console line has standard secure configuration.

**Pattern:** Variable + Enabled + Section (Strict)

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>line_console_strict</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <line xmlns="urn:ios">
                    <console tags=" strict ">
                        <first>0</first>
                        <exec-timeout>
                            <minutes>5</minutes>
                            <seconds>0</seconds>
                        </exec-timeout>
                        <login>
                            <authentication>
                                <auth-name>{$AUTH_NAME}</auth-name>
                            </authentication>
                        </login>
                    </console>
                </line>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
line console 0
  exec-timeout 5 0
  login authentication SECURE_AUTH
```

**Variables Required:**
- `$AUTH_NAME` - Authentication method name

**Download:** [line_console_strict.xml](../../resources/compliance_templates/line_console_strict.xml)

---

## Security Policy Templates

Advanced security enforcement templates.

### acl_deny_options

**Purpose:** Ensure ACLs deny packets with IP options.

**Pattern:** Variable + Regex + Nested (List)

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>acl_deny_options</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <ip xmlns="urn:ios">
                    <access-list>
                        <extended tags=" allow-empty ">
                            <name>{$IPV4_PROTECT}</name>
                            <access-list-seq-rule>
                                <deny>
                                    <ip>
                                        <any/>
                                        <any-dst/>
                                        <option>
                                            <any-options/>
                                        </option>
                                    </ip>
                                </deny>
                            </access-list-seq-rule>
                        </extended>
                    </access-list>
                </ip>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
ip access-list extended PROTECT-IN
  deny ip any any option any-options
```

**Variables Required:**
- `$IPV4_PROTECT` - ACL name to check

**Download:** [acl_deny_options.xml](../../resources/compliance_templates/acl_deny_options.xml)

---

### disable_propagate_ttl

**Purpose:** Ensure MPLS TTL propagation is disabled (for MPLS networks).

**Pattern:** Exact + Disabled + Global

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <template>
        <name>disable_propagate_ttl</name>
        <ned-id>
            <id xmlns:cisco-ios-cli-6.108="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.108">
                cisco-ios-cli-6.108:cisco-ios-cli-6.108
            </id>
            <config>
                <mpls xmlns="urn:ios">
                    <ip>
                        <propagate-ttl>false</propagate-ttl>
                    </ip>
                </mpls>
            </config>
        </ned-id>
    </template>
</compliance>
```

**CLI Equivalent:**
```cisco
no mpls ip propagate-ttl
```

**Download:** [disable_propagate_ttl.xml](../../resources/compliance_templates/disable_propagate_ttl.xml)

---

## Quick Load: All Templates

To load all templates at once, use the bundled XML file:

```bash
developer@ncs# config
developer@ncs(config)# load merge resources/devnet_sandbox/devwks_templates/all-compliance-templates.xml
developer@ncs(config)# commit
```

---

## Template Categories Summary

| Category | Template Count | Use Case |
|----------|----------------|----------|
| Security Baseline | 7 | Fundamental security requirements |
| Network Infrastructure | 3 | Operational configuration standards |
| Operational Standards | 2 | Management and consistency |
| Security Policy | 2 | Advanced security enforcement |

**Total Templates:** 14

---

## Using Templates with Variables

When templates require variables, provide them at report creation time:

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
    <reports>
    <report>
        <name>MyReport</name>
        <device-check>
            <device>dist-rtr01</device>
            <template>
                <name>timezone</name>
                <variable>
                    <name>TIMEZONE</name>
                    <value>EST</value>
                </variable>
                <variable>
                    <name>OFFSET_HOURS</name>
                    <value>-5</value>
                </variable>
                <variable>
                    <name>OFFSET_MINUTES</name>
                    <value>0</value>
                </variable>
            </template>
        </device-check>
    </report>
    </reports>
</compliance>
```

---

## Next Steps

Now that you have access to the complete template library, you can:

- Copy templates for your own NSO environment
- Modify templates to match your policies
- Create new templates based on these examples
- Build comprehensive compliance reports

[Return to Template Examples →](template-examples.md){ .md-button }
[Back to Lab Guide →](../lab-guide/compliance-templates.md){ .md-button }
[Return to Home →](../index.md){ .md-button .md-button--primary }
