# Jobs

## viewing logs from all job containers

```sh
kubectl logs -n 04--job \
  -l job-name=echo-date-better \
  --all-containers=true
```

## Patched service

When getting stuck trying to clean LB pods ( where LB was manually terminated )

```sh
kubectl patch svc <svc-name> -n <ns> -p '{"metadata":{"finalizers":[]}}' --type=merge
```