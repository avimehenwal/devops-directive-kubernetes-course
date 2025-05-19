# Monitoring Cluster Nodes

- Prometheus is the leading FOSS CNCF graduated tool to collect metrics
- https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack can automatically detect and install node_exporter on cluster nodes

## Prometheus-monitoring-stack

```sh
helm install my-kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --version 72.5.0 \
  --namespace monitoring \
  --create-namespace
```

## Service Mesh Monitoring

- https://kubernetestraining.io/blog/istio-kiali-kubernetes-service-mesh-your-microservices

## Monitoring all nodes in Cluster ?

```sh
kubectl create namespace monitoring
kubectl config set-context --current --namespace=monitoring
# verify
kubectl config view --minify --output 'jsonpath={..namespace}'; echo

helm install my-prometheus prometheus-community/prometheus --version 27.16.0 -f ./prometheus_metric_monitoring/values-prometheus.yaml
helm upgrade my-prometheus prometheus-community/prometheus --version 27.16.0 -f ./prometheus_metric_monitoring/values-prometheus.yaml -n metric-monitoring-prometheus
```

### Issue with hrlm chart prometheus-community/prometheus

Unable to get all pods and deployments get working on kind cluster. Image Backoff issues



## Monitoring all Pods & Containers in Cluster ?



## Remove All created Resources

```sh
kubectl delete all --all --all-namespaces --dry-run=client
kubectl delete all --all --all-namespaces
kubectl delete crds --all
```
