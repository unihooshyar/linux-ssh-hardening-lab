#! /bin/bash

#!/bin/bash

USER="ansible"
HOSTS=("ubuntu" "rocky")

echo "=== Checking for existing SSH key ==="

# Generate key ONLY if it does not exist
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    echo "No SSH key found. Generating one..."
    
    ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa" -N ""
    
    echo "SSH key generated."
else
    echo "SSH key already exists. Skipping generation."
fi

echo ""
echo "=== Copying SSH key to hosts ==="

for HOST in "${HOSTS[@]}"; do
    echo "----- $HOST -----"
    
    sshpass -p "ansible" ssh-copy-id -o StrictHostKeyChecking=no $USER@$HOST
    
    if [ $? -eq 0 ]; then
        echo "SUCCESS: $HOST"
    else
        echo "FAILED: $HOST"
    fi
    
    echo ""
done

echo "=== Done ==="