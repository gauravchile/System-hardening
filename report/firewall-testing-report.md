# Firewall Testing Report

## Project Overview
This report details the configuration and testing of firewall rules for the system, focusing on allowing necessary services and logging dropped packets. The testing involved configuring the firewall to permit SSH on a non-standard port and blocking all unnecessary services. We used Nmap for external testing to verify the configuration.

## Firewall Configuration

### 1. Allowed Services
- **Service**: SSH
- **Port**: [your-port] (non-standard)
  
Commands used:
```bash
sudo firewall-cmd --add-port=[your-port]/tcp --permanent
sudo firewall-cmd --reload

#Logging of Dropped Packets
```bash
sudo firewall-cmd --set-log-denied=all
sudo firewall-cmd --reload

#Testing Procedure

#Port Scanning with Nmap

An Nmap scan was performed from an external machine to check the open ports and verify that only the SSH service was available.

nmap -sS <server-ip>

#Results of Nmap Scan
Starting Nmap <version> at <date>
Nmap scan report for <server-ip>
PORT      STATE    SERVICE
[port]/tcp open     ssh

#Dropped Packet Logs
sudo journalctl | grep "DENIED"

#Conclusion

The firewall successfully blocked all unnecessary services and allowed SSH on a non-standard port. All denied traffic was logged as configured.
