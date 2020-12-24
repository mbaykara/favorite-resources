##### 1. `Label` a pod and sort by label via `selector`
```
kubectl label pods <pod_name> <key=value>
kubectl label pods nginx  owner=backend
kubectl get pods --selector owner=backend
```
##### 2. `UpdateStrategy` 
```
2.1 Recreate: for period of time the application is not accessible
2.2 RollingUpdate: keeps application alway accessible
2.2.1 maxUnavailable: determinies the maximum number of Pods are upgraded at the same time
2.2.2 maxSurgeL the number pods tat can run beyond the desired number of Pods as specified in a replica to guarantee minimal  ava.
```
i.e
```
kubectl edit deployments.apps rolling-nginx 

//change for example nginx version, track result via

kubectl rollout history deployment rolling-nginx 

//if you want to rollback
kubectl rollout undo deployment rolling-nginx
```
