#!/bin/bash

# Usage: ./create_snapshots.sh my_snapshot 400 401 402 403 404 405 406

# Check if at least two arguments were passed
if [ $# -lt 2 ]
then
  echo "Usage: $0 <snapshot_name> <vm1> <vm2> ... <vmN>"
  exit 1
fi

# The first argument is the snapshot name
snapshot_name=$1

# Remove the first argument, the rest are the VMs
shift
vms=$@

# Loop through each VM
for vm in $vms; do
  # Create a snapshot for this VM
  qm snapshot $vm $snapshot_name
done
