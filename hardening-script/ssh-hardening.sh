#!/bin/bash

# SSH Hardening Script

# Function to update sshd_config with the provided setting
update_sshd_config() {
    local setting="$1"
    local value="$2"
    
    if grep -q "^#*$setting" /etc/ssh/sshd_config; then
        sudo sed -i "s/^#*$setting.*/$setting $value/" /etc/ssh/sshd_config
    else
        echo "$setting $value" | sudo tee -a /etc/ssh/sshd_config
    fi
}

# Disable root login
echo "Disabling root login..."
update_sshd_config "PermitRootLogin" "no"

# Enforce key-based login by disabling password authentication
echo "Enforcing key-based login..."
update_sshd_config "PasswordAuthentication" "no"

# Restrict SSH users - replace <username> with the actual user(s)
echo "Restricting SSH users..."
read -p "Enter the username to allow SSH access: " ssh_user
update_sshd_config "AllowUsers" "$ssh_user"

# Change the SSH port - replace <non-standard-port> with your preferred port
echo "Changing the SSH port..."
read -p "Enter the new SSH port (e.g., 2222): " ssh_port
update_sshd_config "Port" "$ssh_port"

# Disable weak ciphers
echo "Disabling weak ciphers..."
update_sshd_config "Ciphers" "aes256-ctr,aes192-ctr,aes128-ctr"

# Verify SSH configuration syntax before restarting the service
echo "Checking SSH configuration for errors..."
if sudo sshd -t; then
    echo "SSH configuration is valid. Restarting SSH service..."
    sudo systemctl restart sshd
    echo "SSH hardening complete!"
else
    echo "Error in SSH configuration. Please review the /etc/ssh/sshd_config file."
    exit 1
fi

echo "SSH hardening complete!"

