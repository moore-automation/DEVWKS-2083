# Lab Setup

**⏱️ Estimated time: 5 minutes**

Welcome to the hands-on portion of the NSO Compliance Reporting Workshop! This section will guide you through connecting to your lab environment and preparing for the exercises.

---

## Lab Environment Overview

This lab utilizes the DevNet NSO Sandbox, which includes:

- **NSO Instance** - Network Services Orchestrator running version 6.4.4+
- **Network Devices** - Multiple Cisco IOS-XE routers and switches
- **Development Tools** - Pre-configured development environment

<div class="img-placeholder">
📸 Image Placeholder: Lab Topology Diagram
<br><small>Suggested: Network diagram showing NSO instance and connected devices</small>
</div>

---

## Prerequisites Checklist

Before starting, ensure you have:

!!! info "Required Software"
    - [x] **SSH Client** - Terminal or PuTTY for CLI access
    - [x] **Web Browser** - Modern browser (Chrome, Firefox, Edge, Safari)
    - [x] **Git Client** - For cloning the repository (optional but recommended)

!!! warning "Required Access"
    - [x] **VPN Connection** - Access to DevNet lab network
    - [x] **Lab Credentials** - Provided by your instructor or sandbox reservation
    - [x] **Internet Connection** - Stable connection for VPN and web access

---

## Lab Connection Details

Your lab environment includes the following devices:

| Device | IP Address | Username | Password | Purpose |
|--------|------------|----------|----------|---------|
| NSO Instance #1 | `10.10.20.47` | `developer` | `C1sco12345` | Primary NSO server |
| dist-rtr01 | `10.10.20.175` | `cisco` | `cisco` | Test device for compliance checks |

!!! tip "Port Information"
    - **NSO Web UI:** Port 8080 (HTTP)
    - **NSO CLI:** Port 2024 (SSH)
    - **NSO RESTCONF:** Port 8080 (HTTP)

---

## Step 1: Connect to DevNet Lab VPN

1. **Launch your VPN client** with the provided connection details
   
2. **Enter the VPN address** (provided by your instructor or in sandbox details)

3. **Authenticate** using your lab credentials

4. **Verify connectivity** by pinging the NSO instance:

    ```bash
    ping 10.10.20.47
    ```

!!! success "Connection Verified"
    If you receive ping responses, you're successfully connected to the lab network!

---

## Step 2: Access Lab Details

1. **Navigate to your sandbox reservation page** (URL provided by instructor)

2. **Note the following information:**
   - Sandbox ID
   - Expiration time
   - VPN connection details
   - Any additional resources

!!! warning "Sandbox Duration"
    DevNet sandboxes typically run for 4-8 hours. Save your work regularly and note the expiration time!

---

## Step 3: Clone the Workshop Repository

Clone the workshop repository to your local machine to access templates and examples:

```bash
cd $HOME
git clone --branch cisco-live-devwks-2656 --single-branch \
  https://wwwin-github.cisco.com/cx-usps-auto/compliance-reporting-examples.git
```

!!! note "Alternative Download"
    If you don't have git installed, you can download the repository as a ZIP file from the GitHub page.

**Navigate to the workshop directory:**

```bash
cd compliance-reporting-examples
```

**Explore the repository structure:**

```bash
ls -la
```

You should see:

```
├── resources/               # Workshop resources
│   ├── compliance_templates/    # Pre-built compliance templates
│   ├── compliance_service/      # NSO service package
│   └── devnet_sandbox/          # Lab-specific files
│       ├── device_configs/      # Sample device configs
│       └── devwks_templates/    # Workshop templates
├── docs/                    # Documentation
├── LICENSE                  # Apache 2.0 License
├── Makefile                 # Build automation
├── mkdocs.yml               # Documentation config
├── README.md                # Repository overview
└── requirements.txt         # Python dependencies
```

---

## Step 4: Verify NSO Web UI Access

1. **Open your web browser** and navigate to:
   
    ```
    http://10.10.20.47:8080
    ```

2. **Login to NSO** with the following credentials:
   - **Username:** `developer`
   - **Password:** `C1sco12345`

3. **Explore the NSO interface:**
   - Main dashboard
   - Device panel (left sidebar)
   - Configuration panel
   - Tools menu

<div class="img-placeholder">
📸 Image Placeholder: NSO Web UI Login Screen
<br><small>Suggested: Screenshot of NSO login page and main dashboard</small>
</div>

!!! tip "Browser Compatibility"
    NSO's web UI works best with modern browsers. If you experience issues, try Chrome or Firefox.

---

## Step 5: Verify NSO CLI Access

1. **Open your terminal or SSH client**

2. **Connect to NSO via SSH:**

    ```bash
    ssh developer@10.10.20.47 -p 2024
    ```

3. **Enter the password:** `C1sco12345`

4. **You should see the NSO prompt:**

    ```
    developer@ncs>
    ```

5. **Switch to Cisco-style CLI:**

    ```
    developer@ncs> switch cli
    ```

6. **Now you should see:**

    ```
    developer@ncs#
    ```

!!! success "CLI Access Confirmed"
    You're now connected to the NSO command-line interface!

---

## Step 6: Initial NSO Setup

Before starting the lab exercises, let's ensure NSO has the latest device configurations.

### View Managed Devices

```bash
developer@ncs# show devices list
```

Expected output:

```
NAME         ADDRESS       PORT  AUTHGROUP  DISPLAY NAME  NED ID
---------------------------------------------------------------------------
dist-rtr01   10.10.20.175  22    default    -             cisco-ios-cli-6.109
dist-sw01    10.10.20.176  22    default    -             cisco-ios-cli-6.109
...
```

### Sync Device Configurations

Synchronize all device configurations into NSO's database:

**Via CLI:**

```bash
developer@ncs# devices sync-from
```

**Via Web UI:**

1. Click the **Devices** panel
2. Select all devices (checkbox at top)
3. Choose **Sync from** from the Actions dropdown
4. Click **Run**

<div class="img-placeholder">
📸 Image Placeholder: Device Sync Operation in NSO Web UI
<br><small>Suggested: Screenshot showing device sync operation with results</small>
</div>

!!! tip "What is Sync-From?"
    The `sync-from` operation retrieves the current running configuration from devices and stores it in NSO's Configuration Database (CDB). This is essential for compliance checking!

---

## Verification Checklist

Before proceeding to the lab exercises, verify:

- [x] VPN connection is active
- [x] NSO Web UI is accessible (http://10.10.20.47:8080)
- [x] NSO CLI is accessible (SSH port 2024)
- [x] Repository is cloned to your local machine
- [x] Device configurations are synced into NSO

!!! success "Setup Complete!"
    You're ready to begin the compliance reporting exercises!

---

## Troubleshooting

### Cannot Connect to VPN

- Verify VPN credentials
- Check firewall settings
- Ensure VPN client is up to date
- Contact your instructor or DevNet support

### Cannot Access NSO Web UI

- Verify VPN is connected
- Check the IP address and port (10.10.20.47:8080)
- Clear browser cache
- Try a different browser

### Cannot SSH to NSO

- Verify you're using port 2024 (not default port 22)
- Check username and password
- Verify VPN connectivity
- Try: `ssh -v developer@10.10.20.47 -p 2024` for verbose output

### Device Sync Fails

- Check device connectivity: `devices device dist-rtr01 check-sync`
- Verify device credentials
- Try syncing individual devices first
- Check NSO logs: `show log`

---

## Next Steps

Now that your lab environment is set up and verified, you're ready to explore NSO and learn the basics of navigation and operation.

[Continue to Getting Started →](getting-started.md){ .md-button .md-button--primary }
