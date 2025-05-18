#!/bin/bash
set -e

# Create the Kind cluster
kind create cluster --config ./03-installation-and-setup/kind-config.yaml

# Wait for the cluster to be ready
# kubectl wait --for=condition=Ready nodes --all --timeout=120s


# NOTE: run it manually from outside in seperate tab
# sudo cloud-provider-kind -enable-lb-port-mapping &