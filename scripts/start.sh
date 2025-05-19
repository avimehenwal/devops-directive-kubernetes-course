#!/bin/bash
set -e

NAMESPACE="monitoring"


# 1. Create the Kind cluster
kind create cluster --config ./03-installation-and-setup/kind-config.yaml
kubectl cluster-info --context kind-devops-directive-kubernetes-course

# Wait for the cluster to be ready
# kubectl wait --for=condition=Ready nodes --all --timeout=120s


# NOTE: run it manually from outside in seperate tab
# sudo cloud-provider-kind -enable-lb-port-mapping &


# METRI-SERVER: https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack
# 2. Add Prometheus Community Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# 3. Create the monitoring namespace
kubectl create namespace $NAMESPACE || echo "Namespace $NAMESPACE already exists."
kubectl config set-context --current --namespace=$NAMESPACE

# 4. Install kube-prometheus-stack using Helm
helm upgrade --install loki grafana/loki-stack --namespace ${NAMESPACE} --create-namespace -f ./15-platform-infra-resource/log_monitoring/values-loki-stack.yaml
helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack --version 72.5.1 --namespace ${NAMESPACE} --create-namespace

# 5. Wait for Prometheus pods to be ready
# echo "Waiting for Prometheus pods to be ready..."
# kubectl wait --namespace $NAMESPACE \
#   --for=condition=Ready pods \
#   --selector=app.kubernetes.io/instance=$RELEASE_NAME \
#   --timeout=5m

# 6. Port-forward Prometheus server for local access
# echo "Port-forwarding Prometheus server to http://localhost:9090"
# kubectl --namespace $NAMESPACE port-forward svc/$RELEASE_NAME-kube-prometheus-prometheus 9090:9090