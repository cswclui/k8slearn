
kubectl create ns shinyproxy

#kubectl create configmap shinyproxy-config --from-file=config/
kubectl create configmap shinyproxy-config -n shinyproxy --from-file=config/ \
    --dry-run=client -o yaml  | kubectl apply -n shinyproxy -f -

kubectl describe cm/shinyproxy-config -n shinyproxy

kubectl apply -f sp-authorization.yaml -n shinyproxy
kubectl apply -f sp-deployment.yaml -n shinyproxy
kubectl apply -f sp-service.yaml -n shinyproxy

#check delpoyment status
kubectl get all -n shinyproxy

#launch bash shell to shinyproxy pod
 kubectl exec -n shinyproxy -it svc/shinyproxy -- bash
