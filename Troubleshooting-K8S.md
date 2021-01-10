### 1. Kubernetes components are unhealthy
```
Modify the following files on all master nodes:

$ sudo vi /etc/kubernetes/manifests/kube-scheduler.yaml
Clear the line (spec->containers->command) containing this phrase: - --port=0

$ sudo vi /etc/kubernetes/manifests/kube-controller-manager.yaml
Clear the line (spec->containers->command) containing this phrase: - --port=0

$ sudo systemctl restart kubelet.service
```

### 
