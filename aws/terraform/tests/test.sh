#!/bin/bash

ATTEMPTS=10
COUNTER=0

# wait a minute for instance to start/initialize
sleep 60

# save SSH key into the file
echo "$ICAP_SSH_KEY" > key.pem
chmod 600 key.pem

while [  $COUNTER -lt $ATTEMPTS ]; do
       if ssh -i ./key.pem -q -o BatchMode=yes  -o StrictHostKeyChecking=no -o ConnectTimeout=5 ubuntu@$1 'exit 0'; then
         echo "SSH service is up and running, allowed us to login"
         # remove ssh key just in case
         rm key.pem
         exit 0
       else
         echo "SSH service is not ready yet"
       fi
       echo "Sleeping 10s before the next try"
       sleep 10
       ((COUNTER++))
done

# remove ssh key just in case
rm key.pem

exit 1
