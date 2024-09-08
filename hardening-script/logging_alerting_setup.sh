#!/bin/bash

# Function to install rsyslog
install_rsyslog() {
    echo "Installing rsyslog..."
    sudo yum install -y rsyslog
    if [[ $? -ne 0 ]]; then
        echo "Failed to install rsyslog."
        exit 1
    fi
    echo "rsyslog installed successfully."

    # Start and enable rsyslog service
    echo "Starting and enabling rsyslog service..."
    sudo systemctl start rsyslog
    sudo systemctl enable rsyslog

    if [[ $? -ne 0 ]]; then
        echo "Failed to start and enable rsyslog."
        exit 1
    fi
    echo "rsyslog service started and enabled."
}

# Function to configure logging for SSH and iptables
configure_logging() {
    echo "Configuring logging for SSH and iptables..."

    # Add SSH logging to rsyslog
    echo "Adding SSH logging to rsyslog..."
    echo "if $programname == 'sshd' then /var/log/sshd.log" | sudo tee -a /etc/rsyslog.d/sshd.conf
    sudo systemctl restart rsyslog

    # Configure iptables to log dropped packets
    echo "Configuring iptables to log dropped packets..."
    sudo iptables -A INPUT -j LOG --log-prefix "iptables-dropped: " --log-level 4
    echo "Logging configuration for SSH and iptables is complete."
}

# Function to set up remote logging (if applicable)
configure_remote_logging() {
    read -p "Do you want to enable remote logging? (yes/no): " enable_remote
    if [[ "$enable_remote" == "yes" ]]; then
        echo "Setting up remote logging..."
        read -p "Enter the remote syslog server IP address: " remote_syslog_server
        echo "*.* @@$remote_syslog_server:514" | sudo tee -a /etc/rsyslog.conf
        sudo systemctl restart rsyslog
        echo "Remote logging is set up successfully."
    else
        echo "Skipping remote logging configuration."
    fi
}

# Function to create custom alerts using journalctl
create_journalctl_alerts() {
    echo "Creating custom journalctl alerts for SSH service..."
    sudo journalctl -u sshd -f &
}

# Function to automate log review with cron jobs
automate_log_review() {
    echo "Automating log review for failed password attempts..."
    (crontab -l 2>/dev/null; echo "*/5 * * * * sudo journalctl -u sshd | grep 'Failed password' >> /var/log/failed_password.log") | crontab -
    echo "Log review automation setup complete."
}

# Main script execution
echo "Starting system logging and alerting setup..."

install_rsyslog
configure_logging
configure_remote_logging
create_journalctl_alerts
automate_log_review

echo "System logging and alerting setup completed."

