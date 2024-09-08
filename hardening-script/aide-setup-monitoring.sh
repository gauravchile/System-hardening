#!/bin/bash

# Function to install AIDE
install_aide() {
    echo "Installing AIDE..."
    sudo yum install -y aide
    echo "AIDE installed."
}

# Function to initialize AIDE and set up baseline
initialize_aide() {
    echo "Initializing AIDE database..."
    sudo aide --init
    sudo mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
    echo "AIDE database initialized and baseline set."
}

# Function to configure AIDE to monitor critical files
configure_aide() {
    echo "Configuring AIDE to monitor critical system files..."
    # Adding monitoring for /etc and /var/log directories
    sudo bash -c 'cat <<EOF >> /etc/aide.conf
/etc    FIPSR
/var/log FIPSR
EOF'
    echo "AIDE configured to monitor /etc and /var/log."
}

# Function to run AIDE check
run_aide_check() {
    echo "Running AIDE check for unauthorized changes..."
    sudo aide --check
}

# Function to simulate file modification for testing
simulate_file_modification() {
    echo "Simulating unauthorized change by modifying /etc/passwd..."
    sudo bash -c 'echo "# Test modification" >> /etc/passwd'
    echo "/etc/passwd modified. Re-running AIDE check..."
    run_aide_check
}

# Main script execution
echo "Starting AIDE setup and monitoring script..."

# Step 1: Install AIDE
install_aide

# Step 2: Initialize AIDE and set up baseline
initialize_aide

# Step 3: Configure AIDE to monitor critical system files
configure_aide

# Step 4: Run initial AIDE check
run_aide_check

# Step 5: Simulate unauthorized change and test detection
simulate_file_modification

echo "AIDE monitoring and testing complete."

