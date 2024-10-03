#!/bin/bash

# Function to generate a random hexadecimal string of specified length
generate_hex_random() {
    local length=$1
    openssl rand -hex $length
}

# Function to generate a random hostname of specified length
generate_hostname() {
    local length=$1
    openssl rand -hex $length
}

# Prompt the user to choose between generating OP_NODE_P2P_PRIV/PEER_ID or hostname
echo "Choose an option:"
echo "1. Generate OP_NODE_P2P_PRIV and PEER_ID"
echo "2. Generate hostname of length 12"
read -p "Enter 1 or 2 :  " choice

if [ "$choice" -eq 1 ]; then
    # Generate random OP_NODE_P2P_PRIV (64 characters)
    OP_NODE_P2P_PRIV=$(generate_hex_random 32)

    # Generate random PEER_ID (50 characters)
    PEER_ID=$(generate_hex_random 25)

    # Output the generated values
    echo ""
    echo "peerid: $PEER_ID"
    echo "node_p2p_priv: $OP_NODE_P2P_PRIV"
    echo ""
elif [ "$choice" -eq 2 ]; then
    # Generate random hostname (12 characters)
    HOSTNAME=$(generate_hostname 12)

    # Output the generated hostname
    echo ""
    echo "hostname: $HOSTNAME"
    echo ""
else
    echo "Invalid choice. Please enter 1 or 2."
fi

