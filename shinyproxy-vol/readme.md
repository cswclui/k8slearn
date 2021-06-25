# create shinyproxy namespace
kubectl create ns shinyproxy

# create pvc for shinyproxy config
kubectl apply -f pvc.yaml

# setup volume with applicatiobn.yml
kubectl create -f init-sp.yaml
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
kubectl -n shinyproxy scale deploy/shinyproxy --replicas=0 && \
 kubectl -n shinyproxy scale deploy/shinyproxy --replicas=1

