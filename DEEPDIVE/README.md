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
Platform/
└── ChallengeName/
    ├── nmap/           # Scan results and reconnaissance
    ├── content/        # Downloaded files and web content
    ├── scripts/        # Custom scripts and tools
    ├── exploits/       # Exploits and payloads
    ├── logs/           # Activity logs and command history
    ├── screenshots/    # Evidence and documentation
    ├── evidence/       # Additional evidence files
    ├── NOTES.md        # Organized notes with templates
    ├── start.sh        # Quick navigation helper
    └── back.sh         # Return to platform directory
```

## Requirements

- Bash 4.0+
- Standard Unix utilities (mkdir, cat, chmod)

## Features

### Interactive Setup
- Platform selection first (HTB, TryHackMe, VulnHub, Custom)
- Creates platform directory structure automatically
- Prompts for challenge name with validation
- Prevents duplicate challenges within platforms

### Organized Structure
- Hierarchical organization (Platform/Challenge/)
- Standardized folders for different pentest phases
- Enhanced notes template with date and flags section
- Navigation scripts (start.sh and back.sh)

### Safety Features
- Checks for existing directories within platforms
- Confirms before overwriting existing challenges
- Clear feedback during setup process
- Automatic date tracking in notes

## Notes Template

The generated NOTES.md includes sections for:
- Target information (IP, OS, difficulty, start date)
- Reconnaissance commands with optimized nmap scans
- Open ports and services documentation
- Exploitation steps and findings
- Privilege escalation notes
- Dedicated flags section (User/Root)

## Navigation Scripts

- **start.sh** - Quick overview and navigation commands
- **back.sh** - Return to platform root directory for easy switching between challenges