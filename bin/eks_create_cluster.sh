#!/usr/bin/env bash

CLUSTER="production"
REGION="us-west-2"
CLUSTER_NAME="${CLUSTER}.${REGION}.eksctl.io"

# Check if cluster already exists and create if not
if kubectl config get-clusters | grep -q ${CLUSTER_NAME}; then
    echo
    echo "Cluster '${CLUSTER_NAME}' already exists!"
    echo
else
    echo
    echo "Creating cluster..."
    chmod +x ./bin/eksctl
    ./bin/eksctl create cluster --config-file=./infra/cluster.yml
fi
