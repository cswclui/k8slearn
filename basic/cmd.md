
kubectl get pods --show-labels

kubectl apply -f deploy.yaml --record

kubectl rollout history deploy

kubectl get pods -l "app=nginx"


kubectl run mynginx2 --image=nginx 

kubectl create deployment nginx2 --image=nginx --replica=3



# Reference

- https://www.magalix.com/blog/why-it-is-important-to-use-labels-in-your-workloads-specs