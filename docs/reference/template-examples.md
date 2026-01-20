# Template Examples Reference

This reference guide provides examples of compliance templates organized by pattern type. Use these as a starting point for creating your own compliance policies.

---

## Pattern Categories

Compliance templates can be categorized by three characteristics:

- **[Match Type](#match-type-examples)** - How configuration values are matched
- **[Match Logic](#match-logic-examples)** - Whether features should exist, not exist, or be disabled
- **[Match Pattern](#match-pattern-examples)** - The scope and structure of the check

---

## Match Type Examples

### Exact Match

Configuration must match exactly as specified.

**Example: Password Encryption**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>service-encrypt</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
      </id>
      <config>
        <service xmlns="urn:ios">
          <password-encryption>true</password-encryption>
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

**Use Case:** System-wide services that must be enabled exactly as specified.

---

### Variable Substitution

Configuration includes values that vary by device or location.

**Example: Timezone Configuration**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>timezone</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
      </id>
      <config>
        <clock xmlns="urn:ios">
          <timezone>{$TIMEZONE}</timezone>
          <timezone-offset>{$OFFSET_HOURS}</timezone-offset>
        </clock>
      </config>
    </ned-id>
  </template>
</compliance>
```

**CLI Equivalent:**
```cisco
clock timezone EST -5
```

**Use Case:** Regional settings, device-specific configurations, environment variables.

**Variables Required:**
- `$TIMEZONE` - Timezone name (e.g., EST, PST, UTC)
- `$OFFSET_HOURS` - Hours offset from UTC (e.g., -5, -8, 0)

---

### Regular Expression Match

Configuration must match a pattern or range of values.

**Example: Enable Secret with Encryption Type**

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
enable secret 9 <any-encrypted-string>
```

**Use Case:** Checking that encryption is used without specifying exact encrypted value.

**Regex Explanation:** `.+` means "one or more of any character"

---

## Match Logic Examples

### Enabled Feature

Feature must be present and enabled.

**Example: Login Success/Failure Logging**

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

**Result:** 
- ✅ Pass: Configuration exists and is enabled
- ❌ Fail: Configuration is missing or disabled

---

### Disabled Feature

Feature must be explicitly disabled.

**Example: HTTP Server Disabled**

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

**Result:**
- ✅ Pass: Features are explicitly disabled
- ❌ Fail: Features are enabled or not configured

---

### Absent Configuration

Configuration must NOT exist at all.

**Example: Legacy Enable Password Must Not Exist**

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

**Result:**
- ✅ Pass: `enable password` command doesn't exist
- ❌ Fail: `enable password` command exists (any form)

**Key Tag:** `tags=" absent "` indicates configuration must not be present

---

## Match Pattern Examples

### Global Configuration

Configuration at the top level (global context).

**Example: Small Servers Must Be Disabled**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>service-small-servers</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
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

**Checks:** Legacy small servers must not be configured at global level

---

### Nested Configuration

Configuration under a parent context (e.g., interface, router).

**Example: Interface IP Unreachables**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>interface_unreachables</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
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
interface GigabitEthernet0/1
  no ip unreachables
```

**Key Tags:**
- `tags=" allow-empty "` - Interface type is optional (OK if no GigE interfaces)
- `<name>.*</name>` - Applies to all interfaces of that type

---

### Configuration Section (Block)

Multiple related configuration lines that must appear together.

**Example: Console Line Security**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>line_console_strict</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
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

**Key Tag:** `tags=" strict "` - Only these commands should exist under `line console 0`

---

### Configuration List

Checking for specific entries in a list (ACLs, prefix-lists, etc.).

**Example: ACL Deny IP Options**

```xml
<compliance xmlns="http://tail-f.com/ns/ncs">
  <template>
    <name>acl_deny_options</name>
    <ned-id>
      <id xmlns:cisco-ios-cli-6.109="http://tail-f.com/ns/ned-id/cisco-ios-cli-6.109">
        cisco-ios-cli-6.109:cisco-ios-cli-6.109
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

**Use Case:** Ensuring specific security rules exist in ACLs

---

## Complex Template Examples

### Multiple Routing Protocols

**Example: OSPF and BGP Router-ID from Same Subnet**

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

**Validates:**
- OSPF router-id must be from 10.0.100.0/24
- BGP router-id must be from 10.0.100.0/24 (if BGP is configured)

---

### Loopback Subnet Compliance

**Example: Loopback0 IP from Specific Subnet**

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

**Validates:** Loopback0 IP is allocated from management subnet (10.0.100.0/24)

---

### Auxiliary Line Security

**Example: Disable Aux Port with Security Config**

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

**Validates:**
- Auxiliary line has `no exec`
- Transport input must not be configured (absent)
- Transport output is set to none
- No other configuration under `line aux 0` (strict)

---

## Special Tags Reference

NSO compliance templates support special tags that modify matching behavior:

### absent

Configuration must NOT exist.

```xml
<password>
  <secret tags=" absent ">.+</secret>
</password>
```

---

### allow-empty

Configuration is optional; if it exists, it must match the template.

```xml
<bgp tags=" allow-empty ">
  <as-no>.+</as-no>
  <bgp>
    <router-id>10.0.100.+</router-id>
  </bgp>
</bgp>
```

---

### strict

Only the specified configuration should exist; no additional commands.

```xml
<line xmlns="urn:ios">
  <console tags=" strict ">
    <first>0</first>
    <exec-timeout>...</exec-timeout>
  </console>
</line>
```

---

## Template Design Patterns

### Pattern 1: Security Baseline

Check that required security features are enabled:

- Password encryption
- Login logging
- HTTP servers disabled
- Legacy services absent

### Pattern 2: Operational Standards

Validate operational consistency:

- Timezone configuration
- NTP servers
- Logging destinations
- SNMP community strings

### Pattern 3: Interface Security

Ensure interface-level security:

- No IP unreachables
- No directed broadcasts
- No proxy ARP
- Access groups applied

### Pattern 4: Routing Compliance

Validate routing protocol settings:

- Router IDs from loopback IPs
- Authentication configured
- Passive interfaces set
- Route filtering applied

---

## Quick Reference Table

| Pattern | Match Type | Match Logic | Match Pattern | Example Use |
|---------|------------|-------------|---------------|-------------|
| Exact + Enabled + Global | Exact | Enabled | Global | `service password-encryption` |
| Regex + Enabled + Global | Regex | Enabled | Global | `enable secret 9 <any>` |
| Exact + Absent + Global | Exact | Absent | Global | No `enable password` |
| Regex + Enabled + Nested | Regex | Enabled | Nested | Loopback IP from subnet |
| Exact + Disabled + Global | Exact | Disabled | Global | `no ip http server` |
| Exact + Disabled + Section | Exact | Disabled | Section | `line aux 0` security |

---

## Next Steps

Now that you understand the different template patterns, explore the complete template library to see real-world examples.

[Browse Template Library →](template-library.md){ .md-button .md-button--primary }
[Return to Lab Guide →](../lab-guide/compliance-templates.md){ .md-button }
