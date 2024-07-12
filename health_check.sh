  GNU nano 6.2                                    ./health_check.sh                                             #!/bin/bash

# Disk Space
echo "Disk Space:"
df -h
echo ""

# Memory Usage
echo "Memory Usage:"
free -h
echo ""

# Running Services
echo "Running Services:"
systemctl list-units --type=service --state=running
echo ""

# System Updates (Debian-based systems)
echo "System Updates:"
sudo apt-get update
sudo apt-get upgrade --dry-run
echo ""

# Recommendations
echo "Recommendations:"
echo "1. Ensure sufficient disk space."
echo "2. Monitor memory usage and add more RAM if necessary."
echo "3. Check and restart failed services."
echo "4. Keep the system updated."
