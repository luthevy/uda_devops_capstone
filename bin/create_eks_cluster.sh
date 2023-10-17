#!/usr/bin/env bash
# EKS environment configuration
CLUSTER="production"
REGION="us-west-2"
CLUSTER_NAME="${CLUSTER}.${REGION}.eksctl.io"

# Check if cluster already exists
if kubectl config get-clusters | grep -q ${CLUSTER_NAME}; then
    echo
    echo "Cluster '${CLUSTER_NAME}' already existed!"
    echo
else
    echo
    echo "Creating cluster..."
    chmod +x ./bin/eksctl
    ./bin/eksctl create cluster --config-file=./infra/create_eks_cluster.yml
fi
