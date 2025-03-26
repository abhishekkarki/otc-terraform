#!/bin/bash

set -e

echo "Destroying network resources (VPC, Subnets, Security Groups)..."

terraform destroy \
  -target=module.security_group \
  -target=module.vpc \
  -auto-approve

echo "Network resources destroyed!"
