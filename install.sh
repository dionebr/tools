#!/bin/bash
# install.sh - Install tools globally
# Run with: sudo ./install.sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)"
   exit 1
fi

echo "Installing security tools globally..."

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symbolic links
ln -sf "$SCRIPT_DIR/STP/stp.sh" /usr/local/bin/stp
ln -sf "$SCRIPT_DIR/OSDETECT/osdetect" /usr/local/bin/osdetect  
ln -sf "$SCRIPT_DIR/DEEPDIVE/deepdive" /usr/local/bin/deepdive

echo "Tools installed successfully!"
echo ""
echo "Available commands:"
echo "  stp <nmap_file>    - Extract ports from nmap scan"
echo "  osdetect <ip>      - Detect OS via TTL analysis" 
echo "  deepdive           - Setup pentest environment"
echo ""
echo "Run any command from anywhere in the terminal!"