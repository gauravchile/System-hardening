# 🛡️ System Hardening Project for SOC Analysts

This project demonstrates how to **harden a CentOS 9 system** following security best practices, focusing on system monitoring, auditing, and incident detection.  
Designed for SOC Analysts to understand preventive security measures for detecting, monitoring, and responding to threats.

---

## 📌 Table of Contents
- [Project Overview](#project-overview)
- [System Hardening Steps](#system-hardening-steps)
- [Hardening Scripts](#hardening-scripts)
- [Configuration Files](#configuration-files)
- [Reports and Logs](#reports-and-logs)
- [Testing and Results](#testing-and-results)
- [How to Use](#how-to-use)
- [License](#license)

---

## 📝 Project Overview

The purpose of this project is to harden a Linux system by implementing **best security practices** and monitoring techniques.  
This reduces the attack surface and ensures the system is prepared for potential attacks.

---

## 🔒 System Hardening Steps

1. **SSH Hardening** – Disable root login, enforce key-based authentication, and secure configuration.  
2. **Firewall Setup** – Configure `firewalld` to allow only essential services.  
3. **User and Group Management** – Enforce least privilege, password policies, and account lockouts.  
4. **File Integrity Monitoring** – Set up `AIDE` to detect unauthorized changes.  
5. **Auditing with Auditd** – Monitor key system actions like file changes and login attempts.  
6. **SELinux Enforcement** – Ensure SELinux is in enforcing mode to restrict unauthorized actions.

---

## 🛠️ Hardening Scripts

This repository contains Bash scripts to automate hardening tasks:

- **`firewall-setup.sh`** – Sets up basic firewall rules  
- **`ssh-hardening.sh`** – Secures SSH configuration  
- **`user-management.sh`** – Automates password policies and lockout setup  
- **`file-integrity-monitoring.sh`** – Configures `AIDE` for file integrity checks  
- **`auditd-setup.sh`** – Sets up `Auditd` to monitor critical system actions

---

## ⚙️ Configuration Files

- **`sshd_config`** – Hardened SSH configuration  
- **`aide.conf`** – Configuration file for `AIDE`  
- **`audit.rules`** – Rules for `Auditd` to monitor system events

---

## 📄 Reports and Logs

Check the `reports/` directory for detailed results of security measures:

- Initial and final `Lynis` audits  
- Firewall testing report  
- `AIDE` integrity check results  

---

## 🖥️ Testing and Results

Screenshots and logs showing monitoring in action:

- SSH login monitoring – logs of failed login attempts  
- Firewall logs – dropped packets  
- Auditd logs – tracking file modifications and user actions  

---

## ⚡ How to Use

1. **Clone the repository:**

```bash
git clone https://github.com/yourusername/system-hardening-project.git
cd system-hardening-project
```

2. **Set up the network topology**  
   - Refer to `network_topology/network_diagram.png`  
   - Configure VMs with static IPs as per the diagram

3. **Install and configure system hardening**  

```bash
cd scripts/
sudo ./setup_hardening.sh
```

4. **Customize security settings**  
   - Edit `system_hardening/system_hardening.conf` to adjust hardening rules

5. **Apply security best practices**  
   - Enforce strong password policies  
   - Configure firewall rules (`ufw` or `iptables`)  
   - Disable unnecessary services  
   - Apply security patches and updates

6. **Perform security audits**  
   - Run scripts in `hardening-scripts/` to verify hardening measures  
   - Check system logs for issues or alerts

---

## 📜 License

This project is licensed under the **MIT License**.
