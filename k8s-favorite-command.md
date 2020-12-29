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
##### 3. Create deployment quickly
```
kubectl create deployment --image=nginx mywebserver --replicas=5 -o yaml > nginx.yaml
```
#### 4. Exposing a service
Create a deployment
```
kubectl create deployment nginx --image=nginx --port 80 -o yaml > nginx.yaml
kubectl create -f nginx.yaml
kubectl expose deployment nginx --port 80 --type=NodePort

```
#### 5. Create a namespace and run an application in
```
kubectl create namespace production
```
see all namespaces
```
kubectl get all --all-namespaces
```
To use namespace
```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: nginx
  name: nginx
  namespace: production
```
