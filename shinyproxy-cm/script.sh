
#kubectl create configmap shinyproxy-config --from-file=config/
kubectl create configmap shinyproxy-config -n shinyproxy --from-file=config/ \
    --dry-run=client -o yaml  | kubectl apply -n shinyproxy -f -
kubectl describe cm/shinyproxy-config -n shinyproxy

kubectl apply -f sp-authorization.yaml -n shinyproxy
kubectl apply -f sp-deployment.yaml -n shinyproxy
kubectl apply -f sp-service.yaml -n shinyproxy
kubectl get all -n shinyproxy
