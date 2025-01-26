#!/bin/bash

export PATH=/home/davyjones/.local/bin/:$PATH

# Navigate to the project directory (background process)
cd ~/IBT_Final_Struggle/suiii/ &

# Publish the package and capture the output
publish_output=$(sui client publish --gas-budget 1000000000)

# Extract the transaction digest
transaction_digest=$(echo "$publish_output" | grep -oP 'Transaction Digest: \K[^\s]+')

# Fetch transaction details and save to a JSON file'
  sui client tx-block "$transaction_digest" --json | jq -r '
  {
    TreasuryCap: (.objectChanges[] | select(.objectType? | strings | startswith("0x2::coin::TreasuryCap<")) | { objectType, objectId, version, digest }),
    PublishedPackage: (.objectChanges[] | select(.type == "published") | { packageId, version, digest, modules })
  }
' > outputs.json


