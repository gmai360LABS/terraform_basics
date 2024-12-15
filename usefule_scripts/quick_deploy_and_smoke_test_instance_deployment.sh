#!/bin/bash

# Navigate to the directory containing your Terraform configuration
cd /home/godfrey/gmai360labs/gmai360labs_terraform

# Initialize Terraform
# terraform init

# Apply the Terraform configuration to deploy resources
terraform apply -auto-approve

# Get the public IP of the deployed web server
PUBLIC_IP=$(terraform output -raw public_ip)

# Specify the port (replace with your actual port number)
PORT=8080  # Change to your server's port if needed

# Perform a smoke test using curl to validate the deployment
if curl --output /dev/null --silent --head --fail "http://$PUBLIC_IP:$PORT"; then
    echo "Deployment succeeded! Web server is accessible at http://$PUBLIC_IP:$PORT"
else
    echo "Deployment failed! Web server is not reachable."
fi
