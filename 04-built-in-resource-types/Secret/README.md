# Secret

## Lookup a secret

```sh
kubectl get secrets string-data -o yaml | yq '.data.foo' |  base64 -d
```

## Connecting to Container Registry

