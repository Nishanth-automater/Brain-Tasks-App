#!/bin/bash
set -euo pipefail

WORKDIR="/home/ubuntu/brain-task-deploy"

echo "Deploy hook started at $(date)"
cd "$WORKDIR"

# Update kubeconfig for the cluster (EC2 role is mapped in aws-auth)
echo "Updating kubeconfig for EKS..."
aws eks update-kubeconfig --region us-east-1 --name brain-task-cluster

# Apply manifests (deployment + service)
echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yml
kubectl apply -f k8s/service.yml

