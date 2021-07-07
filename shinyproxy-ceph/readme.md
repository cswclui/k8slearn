# create shinyproxy namespace
kubectl create ns shinyproxy

# create pvc for shinyproxy config
kubectl apply -f pvc.yaml

# setup volume with application.yml and templates
kubectl create -f init-sp.yaml

sleep 3

kubectl cp config/ init-shinyproxy:/etc/shinyproxy/ -n shinyproxy

// kubectl delete -f init-sp.yaml --force

# deploy shinyproxy
kubectl apply -f sp-authorization.yaml -n shinyproxy

kubectl apply -f sp-deployment.yaml -n shinyproxy

kubectl apply -f sp-service.yaml -n shinyproxy

# create sample namespaces and sample pvc
kubectl create ns vlab-jack 
kubectl create ns vlab-jeff 
kubectl apply -f ceph-pvc-users.yaml

# check deployment status
kubectl get all -n shinyproxy

# launch bash shell to shinyproxy pod
kubectl exec -n shinyproxy -it svc/shinyproxy -- bash

# update shinyproxy deployment and restart shinyproxy pod
kubectl apply -f sp-deployment.yaml -n shinyproxy

sleep 1

kubectl -n shinyproxy scale deploy/shinyproxy --replicas=0 &&  kubectl -n shinyproxy scale deploy/shinyproxy --replicas=1

# References


- https://www.cloudops.com/blog/the-ultimate-rook-and-ceph-survival-guide/
- https://github.com/stblassitude/k3s-rook

Mark node as unschedulable:

kubectl cordon node-1
kubectl cordon node-2

Prevent schedule pods on a node:

`kubectl taint node node-1 node-role.kubernetes.io/master:NoSchedule`
`kubectl taint node node-2 node-role.kubernetes.io/master:NoSchedule`



kubectl taint node master-1 node-role.kubernetes.io/master:PreferNoSchedule

To remove taint:

kubectl taint node node-1 node-role.kubernetes.io/master:NoSchedule-


 kubectl taint node master-1 node-role.kubernetes.io/master:NoSchedule


 # port-forward ingress

 kubectl port-forward svc/ingress-nginx-controller -n kube-system --address=0.0.0.0  8085:80 8086:443


