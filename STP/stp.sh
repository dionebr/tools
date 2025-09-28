#!/bin/bash
# stp.sh - Scan-to-Ports: Intelligent Port Extractor
# Optimized for nmap grepable output analysis

scan_to_ports() {
    # Validate input
    if [[ $# -ne 1 ]]; then
        echo "Usage: stp.sh <nmap_output_file>" >&2
        echo "Example: stp.sh target_scan.txt" >&2
        return 1
    fi

    local scan_file="$1"
    
    # File existence check
    if [[ ! -f "$scan_file" ]]; then
        echo "Error: Scan file '$scan_file' not found" >&2
        return 1
    fi

    # Validate nmap format quickly
    if ! head -5 "$scan_file" | grep -q "Host:"; then
        echo "Error: Invalid nmap grepable format detected" >&2
        return 1
    fi

    # Extract host IP
    local target_ip=$(grep -m1 "^Host:" "$scan_file" | awk '{print $2}')
    
    if [[ -z "$target_ip" ]]; then
        echo "Error: No valid target found in scan results" >&2
        return 1
    fi

    # Extract and process ports efficiently
    local port_list=$(grep -oE '[0-9]+/open/' "$scan_file" | cut -d'/' -f1 | sort -un | tr '\n' ',' | sed 's/,$//')

    if [[ -z "$port_list" ]]; then
        echo "Scan completed - No open ports found for $target_ip"
        return 0
    fi

    # Display results
    echo "=== SCAN TO PORTS RESULTS ==="
    echo "Target:    $target_ip"
    echo "Ports:     $port_list"
    echo "============================="

    # Clipboard integration with fallback
    if command -v xclip >/dev/null 2>&1; then
        echo -n "$port_list" | xclip -selection clipboard
        echo "[+] Port list copied to clipboard"
    elif command -v pbcopy >/dev/null 2>&1; then
        echo -n "$port_list" | pbcopy
        echo "[+] Port list copied to clipboard (macOS)"
    else
        echo "[!] Install xclip for automatic clipboard copy"
        echo "[*] Manual copy: $port_list"
    fi
}

# Main execution
scan_to_ports "$@"