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
#### 6. Which command would you use to find all developments by specific label
```
kubectl get deployment --selector app=nginx
```
#### 7. Using ConfigMaps
* In the ckad-ns2 namespace run a Pod based   alpine image named alpine.yaml
* `localport` is set to `localhost:8082`
* `external_url` is set to `linux.com`

#### 8. Using sidecars
* Create namespace `ckad-ns3`
* 1. Container runs `busybox`  and write `date` in `/var/log/date.log`
* 2. Container runs as Sidecar and provice access to that file using `hostPath share volume`
* 3. Images will be pulled only incase of unavailability.

#### 9. Inspecting Containers
* The pod which runs log server has failed. How to analyse it?
#### 10. Using Probes
* Create a Pod that runs the httpd webserver.
* Webserver run in namespace ckad-ns3 and offer services on port `80`
* The Pod should use a readiness probe with initial delay of 60 seconds
* The probe should check the availability of the webserver document root path/ before start and during operation as well
* Each probees should get 60 second before it is initialized

#### 10. Creating Deployment
* Create `nginx-exam.yaml` file with the following requirements
* It starts 5 replicas that run the nginx:1.8 image
* Each Pod has label app=webshop
#### 11. Exposing Services
* In the namespace ckad-ns6, create Deployment that run the nginx 1.8 image and give it the name nginx-deployment
* Ensure 3 replicas
* Expose them
#### 12. Using Network Policies
* Create my-new-policy.yaml that runs two pods network policy
* The Pods do not have provide specific functionality, as long as they will be running for at least 3600 seconds
* One pod simulates running database, the other pod simulates running a webserver
* Use a network policy to restrict traffic between pods in the following way
* Incoming and outgoing traffic to the webserver is allowed without any restrictions
* Only the webserver is allowed to access the databese
* No outgoing traffic is allowed from the database pod

#### 13. Using Storage
Namespace called ckad-1311
* Create PV with the name 1311-pv. It provide 2GiB, readwritemany.
* Create PVC that request 1 GiB with ReadWriteMany named 1311-pvc
* Create Pod named 1311-pod.yaml Persistent Volume, runs nginx mount the volume on the /webdata
