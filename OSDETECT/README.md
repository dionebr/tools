# OSDETECT

OS Detection via TTL Analysis

## Key Features

- Ultra-compact - Single pipeline execution
- Smart pattern matching - Efficient case statement with ranges
- Timeout protection - Prevents hanging on unreachable hosts
- Clean output - Professional formatting
- Multi-OS detection - Linux, Windows, Solaris/Cisco

## Usage

```bash
# Make executable
chmod +x osdetect

# Use with target IP
./osdetect 192.168.1.1
```

## Example usage

```bash
# Detect OS for different targets
./osdetect 192.168.1.1
./osdetect 8.8.8.8
./osdetect google.com
```

## Sample output

```text
192.168.1.1 (ttl:64) -> Linux
192.168.1.100 (ttl:128) -> Windows
```

## Requirements

- Bash 4.0+
- ping command
- timeout command (usually included in coreutils)

## TTL Ranges

- 120-199: Windows systems
- 50-69: Linux systems  
- 250-255: Solaris/Cisco devices
- Other values: Unknown OS

## How it works

The script sends a single ping packet to the target and analyzes the TTL (Time To Live) value in the response. Different operating systems use different default TTL values, allowing for OS fingerprinting based on this information.