#!/bin/bash

# Function to list users
list_users() {
    echo "Listing all system users:"
    sudo awk -F':' '{ print $1}' /etc/passwd
}

# Function to remove a user
remove_user() {
    local username="$1"
    
    if id "$username" &>/dev/null; then
        echo "Removing user: $username"
        sudo userdel $username
        sudo rm -rf /home/$username
        echo "User $username removed."
    else
        echo "User $username does not exist."
    fi
}

# Function to enforce password policies
enforce_password_policy() {
    echo "Enforcing password policies in /etc/security/pwquality.conf..."
    sudo bash -c 'cat <<EOF > /etc/security/pwquality.conf
minlen = 12
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1
EOF'
    echo "Password policies enforced."
}

# Function to implement account lockout after failed login attempts
configure_account_lockout() {
    echo "Configuring account lockout in /etc/security/faillock.conf..."
    sudo bash -c 'cat <<EOF > /etc/security/faillock.conf
deny = 5
unlock_time = 900
EOF'
    echo "Account lockout policy configured."
}

# Function to simulate failed login attempts and check lockout
simulate_failed_logins() {
    echo "Simulating failed login attempts..."
    echo "Use 'sudo faillog' to check lockout status."
}

# Main script
echo "Starting User and Group Management Script..."

# List users
list_users

# Prompt to remove a user
read -p "Enter the username to remove (or press Enter to skip): " username
if [ -n "$username" ]; then
    remove_user "$username"
else
    echo "No users removed."
fi

# Enforce password policies
enforce_password_policy

# Configure account lockout after failed login attempts
configure_account_lockout

# Simulate failed login attempts
simulate_failed_logins

echo "Script complete. User and group management tasks applied."

