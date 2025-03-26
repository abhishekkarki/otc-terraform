#!/bin/bash

set -e

echo "Destroying compute resources (Instances & NICs)..."

terraform destroy \
  -target=module.compute \
  -auto-approve

echo "Compute resources destroyed!"
