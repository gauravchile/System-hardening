#!/bin/bash

# Function to install Auditd
install_auditd() {
    echo "Installing Auditd..."
    sudo yum install -y audit
    if [[ $? -ne 0 ]]; then
        echo "Failed to install Auditd."
        exit 1
    fi
    echo "Auditd installed successfully."

    # Start and enable Auditd service
    echo "Starting and enabling Auditd service..."
    sudo systemctl start auditd
    sudo systemctl enable auditd

    if [[ $? -ne 0 ]]; then
        echo "Failed to start and enable Auditd."
        exit 1
    fi
    echo "Auditd service started and enabled."
}

# Function to monitor file changes
monitor_file_changes() {
    echo "Setting up monitoring for /etc/passwd..."
    sudo auditctl -w /etc/passwd -p wa -k passwd_changes
    if [[ $? -ne 0 ]]; then
        echo "Failed to set up file change monitoring."
        exit 1
    fi
    echo "File change monitoring for /etc/passwd set up successfully."
}

# Function to track user login attempts
track_user_logins() {
    echo "Setting up monitoring for user login attempts..."
    sudo auditctl -w /var/log/secure -p wa -k logins
    if [[ $? -ne 0 ]]; then
        echo "Failed to set up login tracking."
        exit 1
    fi
    echo "User login attempt tracking set up successfully."
}

# Function to check logs
check_logs() {
    echo "Checking logs for file changes in /etc/passwd..."
    sudo ausearch -k passwd_changes
    echo "Checking logs for user login attempts..."
    sudo ausearch -k logins
}

# Main script execution
echo "Starting Auditd configuration and monitoring setup..."
install_auditd
monitor_file_changes
track_user_logins
check_logs

echo "Auditd configuration and monitoring setup completed."

