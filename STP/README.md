# STP - Scan-to-Ports

Intelligent Port Extractor optimized for nmap grepable output analysis

## Key Features

- Robust validation - Verifies nmap format and data integrity
- Efficient extraction - Optimized processing with awk, grep and cut  
- Multi-platform - Support for xclip (Linux) and pbcopy (macOS)
- Clean output - Color-coded professional formatting
- Progress feedback - Real-time status updates during extraction
- Port counting - Shows total number of open ports found
- Error handling - Clear colored messages for different scenarios
- Performance - Fast processing even on large files

## Usage

### Global Installation
```bash
# After running sudo ./install.sh from main directory
stp nmap_scan.txt
```

### Local Usage
```bash
# Make executable
chmod +x stp.sh

# Use with nmap scan file
./stp.sh nmap_scan.txt
```

## Example usage

```bash
# Run nmap in grepable format
nmap -oG target_scan.txt 192.168.1.100

# Extract ports with STP
./stp.sh target_scan.txt
```

## Example output

```text
[*] Extracting information...
[+] IP Address: 192.168.1.100
[+] Open ports: 4

=== SCAN TO PORTS RESULTS ===
Target:    192.168.1.100
Ports:     22,80,443,8080
=============================
[+] Ports copied to clipboard
```

## Requirements

- Bash 4.0+
- xclip (Linux) or pbcopy (macOS) for automatic clipboard copy
- Nmap file in grepable format (-oG)

## Expected input format

The script expects nmap files in grepable format (-oG), which contains lines like:

```
Host: 192.168.1.100 () Status: Up
Host: 192.168.1.100 () Ports: 22/open/tcp//ssh///, 80/open/tcp//http///, 443/open/tcp//https///
```