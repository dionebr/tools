#!/bin/bash
# stp.sh - Scan-to-Ports: Intelligent Port Extractor
# Optimized for nmap grepable output analysis

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

scan_to_ports() {
    # Validate input
    if [[ $# -ne 1 ]]; then
        echo -e "${RED}Usage: stp <nmap_output_file>${NC}" >&2
        echo -e "${YELLOW}Example: stp target_scan.txt${NC}" >&2
        return 1
    fi

    local scan_file="$1"
    
    # File existence check
    if [[ ! -f "$scan_file" ]]; then
        echo -e "${RED}[!] Error: Scan file '$scan_file' not found${NC}" >&2
        return 1
    fi

    echo -e "${BLUE}[*] Extracting information...${NC}"

    # Validate nmap format quickly
    if ! head -5 "$scan_file" | grep -q "Host:"; then
        echo -e "${RED}[!] Error: Invalid nmap grepable format detected${NC}" >&2
        return 1
    fi

    # Extract host IP
    local target_ip=$(grep -m1 "^Host:" "$scan_file" | awk '{print $2}')
    
    if [[ -z "$target_ip" ]]; then
        echo -e "${RED}[!] Error: No valid target found in scan results${NC}" >&2
        return 1
    fi

    echo -e "${GREEN}[+] IP Address: $target_ip${NC}"

    # Extract and process ports efficiently
    local port_list=$(grep -oE '[0-9]+/open/' "$scan_file" | cut -d'/' -f1 | sort -un | tr '\n' ',' | sed 's/,$//')

    if [[ -z "$port_list" ]]; then
        echo -e "${YELLOW}[!] No open ports found for $target_ip${NC}"
        return 0
    fi

    # Count ports
    local port_count=$(echo "$port_list" | tr ',' '\n' | wc -l)
    echo -e "${GREEN}[+] Open ports: $port_count${NC}"

    # Display formatted results
    echo ""
    echo -e "${BLUE}=== SCAN TO PORTS RESULTS ===${NC}"
    echo -e "${GREEN}Target:${NC}    $target_ip"
    echo -e "${GREEN}Ports:${NC}     $port_list"
    echo -e "${BLUE}=============================${NC}"

    # Clipboard integration with fallback
    if command -v xclip >/dev/null 2>&1; then
        echo -n "$port_list" | xclip -selection clipboard
        echo -e "${GREEN}[+] Ports copied to clipboard${NC}"
    elif command -v pbcopy >/dev/null 2>&1; then
        echo -n "$port_list" | pbcopy
        echo -e "${GREEN}[+] Ports copied to clipboard (macOS)${NC}"
    else
        echo -e "${YELLOW}[!] Install xclip for automatic clipboard copy${NC}"
        echo -e "${GREEN}[*] Manual copy: $port_list${NC}"
    fi
}

# Main execution
scan_to_ports "$@"