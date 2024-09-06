# System Hardening Project for SOC Analysts

This project demonstrates how to harden a CentOS 9 system following security best practices, focusing on system monitoring, auditing, and incident detection. It is designed for SOC Analysts who need to understand how preventive security measures can help detect, monitor, and respond to threats.

## Table of Contents
- [Project Overview](#project-overview)
- [System Hardening Steps](#system-hardening-steps)
- [Hardening Scripts](#hardening-scripts)
- [Configuration Files](#configuration-files)
- [Reports and Logs](#reports-and-logs)
- [Testing and Results](#testing-and-results)
- [How to Use](#how-to-use)

## Project Overview
The purpose of this project is to harden a Linux system by implementing best security practices and monitoring techniques. This helps reduce the attack surface and ensures the system is prepared for potential attacks.

## System Hardening Steps
1. **SSH Hardening**: Securing SSH by disabling root login, enforcing key-based authentication, and more.
2. **Firewall Setup**: Configuring `firewalld` to limit exposure to essential services.
3. **User and Group Management**: Enforcing least privilege and implementing lockout policies.
4. **File Integrity Monitoring**: Setting up `AIDE` to detect unauthorized changes.
5. **Auditing with `Auditd`**: Monitoring key system actions like file changes and login attempts.
6. **SELinux Enforcement**: Ensuring SELinux is in enforcing mode to restrict unauthorized actions.

## Hardening Scripts
This repository contains Bash scripts to automate hardening tasks:
- **`firewall-setup.sh`**: Sets up basic firewall rules.
- **`ssh-hardening.sh`**: Configures SSH securely.
- **`user-management.sh`**: Automates password policies and lockout setup.
- **`file-integrity-monitoring.sh`**: Configures `AIDE` for file integrity checks.
- **`auditd-setup.sh`**: Sets up `Auditd` to monitor critical system actions.

## Configuration Files
- **`sshd_config`**: The hardened configuration for SSH.
- **`aide.conf`**: Configuration file for AIDE.
- **`audit.rules`**: Rules used by `Auditd` to monitor system events.

## Reports and Logs
You can find the detailed results of the security measures in the `reports/` directory:
- **Initial and final `Lynis` audits**.
- **Firewall testing report**.
- **AIDE integrity check results**.

## Testing and Results
Screenshots of logs and monitoring tools in action:
- **SSH login monitoring**: Screenshot showing how failed login attempts are logged.
- **Firewall logs**: Logs of dropped packets.
- **Auditd logs**: Tracking file modifications and user actions.

## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/system-hardening-project.git
   cd system-hardening-project


##Set Up the Network Topology

   Refer to network_diagram.png in the network_topology/ folder.
   Set up VMs as per the diagram with static IP addresses.
   Install and Configure System Hardening

   Use the setup_hardening.sh script in the scripts/ folder to apply basic hardening configurations.
   Customize the system_hardening.conf file located in the system_hardening/ folder with security settings. 
   Apply Security Best Practices

##Implement best practices such as:
   Enforcing strong password policies.
   Configuring firewall rules (using ufw or iptables).
   Disabling unnecessary services.
   Applying security patches and updates.
   Perform Security Audits

   Run scripts from the hardening-scriptss/ folder to verify that hardening measures are effectively applied.
   Check system logs for any issues or alerts related to security configurations.

##License
   This project is licensed under the MIT License.
