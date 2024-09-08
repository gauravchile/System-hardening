# AIDE Check Report

## Project Overview
This report provides details on the installation, configuration, and testing of the **Advanced Intrusion Detection Environment (AIDE)** to monitor file integrity in key system directories. The AIDE tool was used to detect unauthorized changes to critical system files.

## AIDE Configuration

### 1. AIDE Installation and Initialization
AIDE was installed and initialized on the system.

Commands used:
```bash
sudo yum install aide
sudo aide --init
sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

#Configuration File
The /etc/aide.conf file was configured to monitor the following directories:

/etc
/var/log

Sample entry from /etc/aide.conf:

/etc    NORMAL
/var/log    NORMAL

#Testing Procedure

#Baseline Creation
A baseline was created after installation to serve as a reference for future checks.

sudo aide --check

#Simulating Unauthorized Changes
An unauthorized modification was made to /etc/passwd to test if AIDE detects the change.

sudo vi /etc/passwd
# Modified the file.

#AIDE Check for Changes
AIDE was run again to detect the unauthorized modification.

sudo aide --check

#AIDE Check for Changes
AIDE was run again to detect the unauthorized modification.

sudo aide --check

#Results of AIDE Check

File: /etc/passwd
Size: old -> new
Checksum: old -> new
...

#Conclusion

AIDE was successfully configured to monitor critical system files. The tool detected unauthorized changes, providing reliable file integrity monitoring for the system.
