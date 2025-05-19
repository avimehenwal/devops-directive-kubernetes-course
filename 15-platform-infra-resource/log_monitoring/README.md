# Log Monitoring & Aggregation

> for Analysis

## Loki-Stacl

https://artifacthub.io/packages/helm/grafana/loki-stack

special image that installs and uses fluentbit with loki

```sh
helm upgrade --install loki grafana/loki-stack --namespace monitoring --create-namespace --set fluent-bit.enabled=true,promtail.enabled=false -f ./values-loki-stack.yaml

# Add loki datasource to Grafana - automatically taken care by chart using annotation: grafana_datasource
# kubectl create configmap loki-datasource --from-file=loki-datasource.yaml -n monitoring
```
