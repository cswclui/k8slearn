
kubectl get pods --show-labels

kubectl apply -f deploy.yaml --record

kubectl rollout history deploy

kubectl get pods -l "app=nginx"


# Reference

- https://www.magalix.com/blog/why-it-is-important-to-use-labels-in-your-workloads-specs