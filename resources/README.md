# DEVWKS-2083 Workshop Resources

This folder contains all the resources needed for the NSO Compliance Reporting Workshop.

## Contents

### `compliance_templates/`

Pre-built NSO compliance templates for common security and operational policies:

- **acl_deny_options.xml** - ACL rule to deny IP options
- **disable_propagate_ttl.xml** - Disable TTL propagation
- **interface_unreachables.xml** - Check interface unreachable settings
- **line_console_strict.xml** - Strict console line configuration
- **service_encrypt.xml** - Service password encryption
- **service_small_servers.xml** - Small servers service check
- **timezone.xml** - Timezone configuration validation

### `compliance_service/`

NSO service package for continuous compliance monitoring:

- **python/** - Python service implementation
- **src/yang/** - YANG models for compliance service
- **test/** - Service test cases
- **package-meta-data.xml** - Package metadata

This service provides a framework for defining policy and policy scope, translating policy intent into built-in compliance reports with template variable re-use and group definitions.

### `devnet_sandbox/`

DevNet Sandbox-specific configurations and templates:

#### `blank_templates/`
- Empty template files for creating new configurations

#### `device_configs/`
Device configuration backups:
- core-rtr01.txt
- dev-core-rtr01.txt
- dev-dist-rtr01.txt
- dev-dist-sw01.txt
- dist-rtr01.txt
- dist-sw01.txt
- internet-rtr01.txt

#### `devwks_templates/`
Workshop-specific NSO templates:
- all-compliance-reports.xml
- all-compliance-templates.xml
- all-device-templates.xml
- enable-secret.xml
- line-aux.xml
- login-policy.xml
- loopback0.xml
- no-enable-password.xml
- no-http-server.xml
- router-id.xml

#### `nso_services/`
- **web-secure/** - Sample NSO service package
- **web-secure.tar.gz** - Packaged service

#### `nso_sandbox_lab.md`
Detailed lab guide for the NSO Sandbox environment.

## Usage

These resources are referenced throughout the workshop documentation. They provide:

1. **Compliance Templates** - Ready-to-use templates demonstrating various compliance patterns
2. **Service Package** - Advanced compliance automation service
3. **Sandbox Configurations** - Pre-configured device templates and services for hands-on exercises

## Prerequisites

- NSO 6.4.3 or higher
- Python 3.9 or higher
- Access to DevNet Sandbox or equivalent NSO instance

## Related Documentation

See the main [workshop documentation](../docs/index.md) for detailed usage instructions and lab exercises.
