#!/bin/bash

# Function to enforce SELinux
enforce_selinux() {
    echo "Enforcing SELinux..."

    # Enable SELinux enforcing mode temporarily
    sudo setenforce 1
    if [[ $? -ne 0 ]]; then
        echo "Failed to set SELinux to enforcing mode."
        exit 1
    fi
    echo "SELinux is temporarily in enforcing mode."

    # Make SELinux enforcing mode permanent
    echo "Setting SELinux to enforcing mode permanently..."
    sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
    if [[ $? -ne 0 ]]; then
        echo "Failed to configure SELinux to enforcing mode."
        exit 1
    fi
    echo "SELinux is now configured to enforcing mode permanently."
}

# Function to monitor SELinux violations
monitor_selinux_violations() {
    echo "Monitoring SELinux violations..."

    # Use ausearch to monitor AVC (Access Vector Cache) violations
    sudo ausearch -m avc
    if [[ $? -ne 0 ]]; then
        echo "Failed to monitor SELinux violations."
        exit 1
    fi
    echo "Monitoring SELinux violations completed."
}

# Function to simulate a restricted action for testing SELinux
simulate_selinux_violation() {
    echo "Testing SELinux by simulating a violation..."

    # Example: Try to access a directory that SELinux denies access to
    mkdir /restricted_test
    sudo chcon -t httpd_sys_content_t /restricted_test

    # Try accessing it as a non-authorized service (simulated action)
    sudo -u nobody ls /restricted_test
}

# Main script execution
echo "Starting SELinux enforcement and monitoring setup..."

enforce_selinux
monitor_selinux_violations
simulate_selinux_violation

echo "SELinux enforcement and monitoring setup completed."

