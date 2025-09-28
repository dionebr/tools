# Security Tools Collection

A collection of custom security and penetration testing tools.

## Tools

### STP - Scan-to-Ports
Intelligent Port Extractor optimized for nmap grepable output analysis.

**Location:** `STP/`
**Usage:** `./stp.sh nmap_scan.txt`

### OSDETECT
OS Detection via TTL Analysis for quick system fingerprinting.

**Location:** `OSDETECT/`  
**Usage:** `./osdetect 192.168.1.1`

## Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/security-tools.git

# Navigate to tool directory
cd security-tools/STP
chmod +x stp.sh

cd ../OSDETECT
chmod +x osdetect
```

## Contributing

Feel free to contribute by adding new tools or improving existing ones.

## License

This project is licensed under the MIT License.