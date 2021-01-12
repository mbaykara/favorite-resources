#### 1. Scale up/down deployment
```
kubectl scale deployment webserver --replicas=6 
or
kubectl edit deployment webserver
```
#### 2. Label a deployment and list deployments with a specific label
```
kubectl label deployments.app webserver  state=production
kubectl get deployments.apps --selector state=production
```
#### 3. StatefulSets
* like deployment but provide guarantees about the ordering and uniqueness of Pods
* StatefulSet maintains a unique identity for each Pod, which makes it so Pods are not interchangeable
* StatefulSet are valuable if the application has one of the following req
* unique network identifiers, stable persistent storage, ordered deployment and scaling ordered automated rolling updates

#### 4. Run a deployment that starts one nginx webserver Pod on all cluster nodes

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-allnode 
  namespace: kube-system
  labels:
    k8s-app: fluentd-logging
spec:
  selector:
    matchLabels:
      name: nginx-allnode 
  template:
    metadata:
      labels:
        name: nginx-allnode
    spec:
      containers:
      - name: nginx-allnode 
        image: nginx
```
