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
