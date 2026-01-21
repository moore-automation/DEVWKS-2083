# DEVWKS-2083 - The Journey of Automating Network Compliance using Cisco NSO

<div class="img-placeholder">
<br><small><img src="assets/images/banner.png"></small>
</div>

## Welcome to the Workshop!

### 1st task Create the Compliance Template

Navigate to configuration Editor -> ncs:devices

<br><small><img src="assets/images/001.png"></small>


**⏱️ Total workshop time: ~45 minutes**

Welcome to the Cisco NSO Network Compliance Reporting Workshop! This hands-on lab explores how to leverage Cisco Network Services Orchestrator (NSO) to automate network compliance auditing using compliance templates.

Compliance templates were first introduced in NSO 6.1, and this workshop demonstrates the ongoing enhancements to compliance reporting using NSO 6.4+. You'll learn how to translate policy requirements into automated compliance checks, generate comprehensive reports, and remediate non-compliant configurations.

---

## What You'll Learn

Throughout this workshop, you will:

- :material-check-circle: **Understand compliance patterns** - Learn the different types of compliance checks and when to use each approach
- :material-file-document-outline: **Build compliance templates** - Create NSO compliance templates from policy requirements
- :material-chart-bar: **Generate compliance reports** - Run automated compliance audits across your network infrastructure
- :material-tools: **Remediate findings** - Use NSO to fix non-compliant configurations
- :material-rocket-launch: **Advanced automation** - Explore compliance services for continuous monitoring

---

## Workshop Prerequisites

Before starting this lab, you should have:

!!! info "Required Knowledge"
    - Basic understanding of network configuration (Cisco IOS/IOS-XE)
    - Familiarity with CLI operations
    - Basic XML/YAML concepts (helpful but not required)

!!! warning "Lab Requirements"
    - Access to DevNet Sandbox or NSO instance
    - SSH client
    - Web browser
    - Internet connection

---

## Workshop Structure

This workshop is organized into the following sections:

### :material-book-open-variant: Introduction

Learn about NSO compliance reporting fundamentals and the different patterns for compliance checks.

[Start with Introduction →](introduction/overview.md){ .md-button .md-button--primary }

### :material-flask: Lab Guide

Follow the hands-on exercises to build compliance templates, generate reports, and remediate configurations.

[Jump to Lab Guide →](lab-guide/setup.md){ .md-button }

### :material-library: Reference

Access the complete template library and examples for your own compliance automation projects.

[Browse Reference →](reference/template-examples.md){ .md-button }

---

## Lab Objectives

By the end of this workshop, you will have completed:

1. **Getting Connected** - Access your NSO sandbox environment
2. **NSO Basics** - Navigate the NSO GUI and CLI interfaces
3. **Build Templates** - Create 8+ compliance templates covering different patterns
4. **Generate Reports** - Run comprehensive compliance audits
5. **Remediation** - Fix non-compliant configurations using device templates
6. **Advanced Topics** *(Optional)* - Build compliance services for continuous monitoring

---

## About This Workshop

This workshop repository contains:

- **Compliance Templates** - Pre-built templates for common security and operational policies
- **Device Templates** - Remediation templates to fix common compliance issues
- **NSO Service Package** - Example compliance service for continuous monitoring
- **Lab Exercises** - Step-by-step instructions with CLI and GUI examples

---

## Getting Started

Ready to begin? Start with the [Introduction](introduction/overview.md) to understand the fundamentals of NSO compliance reporting, or jump directly to the [Lab Setup](lab-guide/setup.md) if you're already familiar with the concepts.

<div style="text-align: center; margin-top: 2em;">
  <a href="introduction/overview.md" class="md-button md-button--primary" style="margin: 0.5em;">
    📚 Learn the Fundamentals
  </a>
  <a href="lab-guide/setup.md" class="md-button" style="margin: 0.5em;">
    🚀 Start the Lab
  </a>
</div>

---

## Need Help?

!!! tip "Workshop Resources"
    - **Documentation**: Full NSO documentation at [developer.cisco.com](https://developer.cisco.com/docs/nso/)
    - **DevNet**: Join the community at [developer.cisco.com/devnet](https://developer.cisco.com)
    - **GitHub**: Report issues or contribute at the [repository](https://github.com/moore-automation/DEVWKS-2083)

---

<div style="text-align: center; color: #888; font-size: 0.9em; margin-top: 3em;">
  Built with ❤️ by Cisco CX Automation Team | Cisco Live 2026
</div>
