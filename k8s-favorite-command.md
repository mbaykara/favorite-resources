##### 1. `Label` a pod and sort by label via `selector`
```
kubectl label pods <pod_name> <key=value>
kubectl label pods nginx  owner=backend
kubectl get pods --selector owner=backend
```
##### 2. `Label` a pod and sort by label via `selector`
