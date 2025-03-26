#!/bin/bash

# Retrieve project name from Vault and export it.
export OS_PROJECT_NAME=$(vault kv get -field=project_name secret/otc)

# Check for the command-line argument.
if [ "$1" == "apply" ]; then
    echo "Initializing Terraform..."
    terraform init -upgrade

    echo "Creating Terraform plan..."
    terraform plan -out=tfplan.out

    # Ask for confirmation before applying the plan.
    read -p "Do you want to apply this plan? (y/N): " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Applying plan..."
        terraform apply tfplan.out
    else
        echo "Plan not applied."
    fi

elif [ "$1" == "destroy" ]; then
    # Confirm before destroying.
    read -p "Are you sure you want to destroy all resources? (y/N): " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Destroying Terraform-managed infrastructure..."
        terraform destroy -auto-approve
    else
        echo "Destroy cancelled."
    fi
else
    echo "Usage: $0 {apply|destroy}"
    exit 1
fi
