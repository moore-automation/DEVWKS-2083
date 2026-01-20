# DEVWKS-2083: Cisco NSO Compliance Reporting Workshop

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

## Workshop Overview

This hands-on workshop explores how to leverage Cisco Network Services Orchestrator (NSO) to automate network compliance auditing using compliance templates. Learn how to translate policy requirements into automated compliance checks, generate comprehensive reports, and remediate non-compliant configurations.

**Duration:** ~45 minutes

## What You'll Learn

* **Compliance Patterns** - Understand different types of compliance checks and when to use each approach
* **Template Creation** - Build NSO compliance templates from policy requirements
* **Report Generation** - Run automated compliance audits across network infrastructure
* **Remediation** - Use NSO to fix non-compliant configurations automatically
* **Advanced Automation** - Explore compliance services for continuous monitoring

## Introduction

This repository demonstrates how to leverage Cisco Network Services Orchestrator (NSO) compliance reporting to audit network configurations using compliance templates first introduced in NSO 6.1. The repo explores several flavors of compliance check patterns, the process of creating an NSO compliance template, and an example framework for a continuous compliance reporting service that allows policy rules to be translated into built-in compliance reports.

## Overview of Compliance Check Patterns

Several patterns emerge when creating compliance checks. In general, a compliance check can be described by 3 characteristics: the match type, the match pattern, and the match logic. Understanding which categories a compliance check falls into will help guide in selecting the appropriate template pattern to use.

To begin classifying a compliance check, you must first create the intended network configuration for the PASS condition and/or the FAIL condition (as appropriate). This configuration is then assessed for each of the categories below.

### Match Type

The match type category determines any required conditions for a given configuration to be matched. This has template implications as variables must be referenced and regular expression conditions must be well understood.

1. exact match
2. variable substitution
3. regular expression match

### Match Logic

The match logic category determines how a given configuration is evaluated. This has template implications as features may need to be present, absent, present but disabled, absent but enabled, or evaluated (ie count).

1. enabled feature
2. disabled feature
3. absent configuration
4. comparison operations (ex. 2 or more ntp servers)

### Match Pattern

The match pattern category determines the scope of a given configuration match. This has template implications as configuration elements may be nested, may require matching multiple lines, or may require iterating through a list of values.

1. global configuration
2. nested configuration
3. configuration list
4. configuration section (multiple lines)

## Getting Started

### Option 1: Using Make (Recommended)

```bash
# Clone the repository
git clone https://github.com/cisco/compliance-reporting-examples.git
cd compliance-reporting-examples

# Install dependencies
make install

# Start the development server
make serve

# Open your browser to http://localhost:8000
```

### Option 2: Manual Setup

```bash
# Clone the repository
git clone https://github.com/cisco/compliance-reporting-examples.git
cd compliance-reporting-examples

# Create virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Start MkDocs server
mkdocs serve
```

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make help` | Display available commands |
| `make install` | Set up Python virtual environment and install dependencies |
| `make serve` | Start local development server at http://localhost:8000 |
| `make build` | Build static site to `site/` directory |
| `make clean` | Remove built files and Python cache |
| `make clean-all` | Remove everything including virtual environment |

## Prerequisites

1. NSO 6.4.3 or higher version is required
2. Python 3.9 or higher version is required

## Repository Contents

- **Compliance Templates** - Pre-built templates for common security and operational policies
- **Device Templates** - Remediation templates to fix common compliance issues
- **NSO Service Package** - Example compliance service for continuous monitoring
- **Lab Exercises** - Step-by-step instructions with CLI and GUI examples
- **Documentation** - Comprehensive guide to compliance patterns and best practices

## Workshop Structure

1. **Introduction** - NSO compliance reporting fundamentals
2. **Lab Setup** - Connect to DevNet Sandbox environment
3. **Getting Started** - Navigate NSO CLI and web interface
4. **Building Compliance Templates** - Create 8+ compliance templates
5. **Generating Compliance Reports** - Run comprehensive audits
6. **Remediation** - Fix non-compliant configurations
7. **Advanced Topics** *(Optional)* - Compliance services and continuous monitoring

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

## Community

- [Code of Conduct](docs/CODE_OF_CONDUCT.md)
- [Security Policy](docs/SECURITY.md)

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Support

For questions or issues:

- Open an [issue](https://github.com/cisco/compliance-reporting-examples/issues)
- Visit [Cisco DevNet](https://developer.cisco.com)
- Email: usps-nso-support@cisco.com

## Acknowledgments

- Cisco DevNet for sandbox infrastructure
- NSO development community
- Cisco Live 2026 attendees

---

**Ready to begin?**

Start with the [Introduction](https://cisco.github.io/compliance-reporting-examples/introduction/overview/) or jump to the [Lab Setup](https://cisco.github.io/compliance-reporting-examples/lab-guide/setup/) if you're already familiar with the concepts.
