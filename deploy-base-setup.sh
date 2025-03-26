#!/bin/bash

set -e

echo "Deploying network components (VPC, Subnets, Security Groups)..."

terraform init

terraform apply \
  -target=module.vpc \
  -target=module.security_group \
  -auto-approve

echo "Network infrastructure deployed!"
