#!/bin/bash
set -e

# Stop cloud-provider-kind
pkill -f cloud-provider-kind || true

# Delete the Kind cluster
kind delete cluster --name devops-directive-kubernetes-course