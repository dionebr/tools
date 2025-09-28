# Security Tools Collection

A collection of custom security and penetration testing tools.

## Tools

### STP - Scan-to-Ports
Intelligent Port Extractor optimized for nmap grepable output analysis.

**Usage:** `stp nmap_scan.txt`

### OSDETECT
OS Detection via TTL Analysis for quick system fingerprinting.

**Usage:** `osdetect 192.168.1.1`

### DEEPDIVE
Automated Pentest Environment Setup - Creates organized folder structure.

**Usage:** `deepdive`

## Installation

### Global Installation (Recommended)
```bash
# Clone the repository
git clone https://github.com/dionebr/tools.git
cd tools

# Install globally (requires sudo)
sudo ./install.sh

# Now use commands anywhere:
stp scan.txt
osdetect 192.168.1.1
deepdive
```

### Local Usage
```bash
# Navigate to specific tool directory
cd STP && ./stp.sh scan.txt
cd ../OSDETECT && ./osdetect 192.168.1.1
cd ../DEEPDIVE && ./deepdive
```

## Contributing

Feel free to contribute by adding new tools or improving existing ones.

## License

This project is licensed under the MIT License.