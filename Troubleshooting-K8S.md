### 1. Kubernetes components are unhealthy
```
Modify the following files on all master nodes:

$ sudo vi /etc/kubernetes/manifests/kube-scheduler.yaml
Clear the line (spec->containers->command) containing this phrase: - --port=0

$ sudo vi /etc/kubernetes/manifests/kube-controller-manager.yaml
Clear the line (spec->containers->command) containing this phrase: - --port=0

$ sudo systemctl restart kubelet.service
```

### 2. `Error from server (InternalError): error when creating "aks.yaml": Internal error occurred: failed calling webhook "validate.nginx.ingress.kubernetes.io": Post "https://testnginx-ingress-nginx-controller-admission.testnginx.svc:443/networking/v1beta1/ingresses?timeout=10s": service "testnginx-ingress-nginx-controller-admission" not found`

#### Solution

```
//get the validationhook and delete it corresponding one
kubectl get validatingwebhookconfigurations.admissionregistration.k8s.io
kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io  [nameOfVHook]
```
and 
```
 kubectl get clusterrolebindings.rbac.authorization.k8s.io
```
cluster binding
```
 2142  kubectl get clusterrolebindings.rbac.authorization.k8s.io
 2143  kubectl delete clusterrolebindings.rbac.authorization.k8s.io testningx-ingress-nginx
 2144  kubectl delete clusterrolebindings.rbac.authorization.k8s.io testnginx-ingress-nginx
 2145  kubectl get clusterrolebindings.rbac.authorization.k8s.io enginx-ingress-nginx
 2146  kubectl delete clusterrolebindings.rbac.authorization.k8s.io enginx-ingress-nginx
 2147  kubectl get clusterrolebindings.rbac.authorization.k8s.io enginx-ingress-nginx
 2148  kubectl get clusterrolebindings.rbac.authorization.k8s.io
 2150  kubectl delete clusterrolebindings.rbac.authorization.k8s.io nginx-ingress-ingress-nginx
 ```
