#!/bin/bash

set -e

echo "Deploying compute resources (Instances & NICs)..."

terraform init

terraform apply \
  -target=module.compute \
  -auto-approve

echo "Compute infrastructure deployed!"
