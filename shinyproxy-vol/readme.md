# create shinyproxy namespace
kubectl create ns shinyproxy

# create pvc for shinyproxy config
kubectl apply -f pvc.yaml

# setup volume with application.yml and templates
kubectl create -f init-sp.yaml

sleep 5

kubectl cp config/ init-shinyproxy:/etc/shinyproxy/ -n shinyproxy

kubectl delete -f init-sp.yaml --force

# deploy shinyproxy
kubectl apply -f sp-authorization.yaml -n shinyproxy

kubectl apply -f sp-deployment.yaml -n shinyproxy

kubectl apply -f sp-service.yaml -n shinyproxy

# check delpoyment status
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

Prevent schedule pods on a node:

`kubectl taint node mymasternode node-role.kubernetes.io/master:NoSchedule`

