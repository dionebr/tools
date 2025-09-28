# DEEPDIVE

Automated Pentest Environment Setup - Creates organized folder structure for CTF/pentest challenges

## Key Features

- Interactive challenge setup with platform selection
- Creates standardized folder structure for pentesting
- Generates pre-formatted notes template with common commands
- Quick navigation script for efficient workflow
- Prevents accidental overwrites
- Multi-platform support (HTB, TryHackMe, VulnHub, Custom)

## Usage

### Global Installation
```bash
# After running sudo ./install.sh from main directory
deepdive
```

### Local Usage
```bash
# Make executable
chmod +x deepdive

# Run the setup
./deepdive
```

## Example usage

```bash
./deepdive
# Enter challenge name: SeaCorp
# Select platform: 1 (HackTheBox)
# Creates complete environment structure
```

## Folder structure created

```
ChallengeName/
├── nmap/           # Scan results and reconnaissance
├── content/        # Downloaded files and web content
├── scripts/        # Custom scripts and tools
├── exploits/       # Exploits and payloads
├── logs/           # Activity logs and command history
├── screenshots/    # Evidence and documentation
├── NOTES.md        # Organized notes with templates
└── start.sh        # Quick navigation helper
```

## Requirements

- Bash 4.0+
- Standard Unix utilities (mkdir, cat, chmod)

## Features

### Interactive Setup
- Prompts for challenge name and platform
- Platform selection (HTB, TryHackMe, VulnHub, Custom)
- Validation and error handling

### Organized Structure
- Standardized folders for different pentest phases
- Pre-configured notes template with common nmap commands
- Quick access navigation script

### Safety Features
- Checks for existing directories
- Confirms before overwriting
- Clear feedback during setup process

## Notes Template

The generated NOTES.md includes sections for:
- Target information (IP, OS, difficulty)
- Reconnaissance commands and results
- Open ports and services documentation
- Exploitation steps and findings
- Privilege escalation notes