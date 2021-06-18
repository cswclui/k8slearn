
# Setup
## Add repos
```

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

```

## Install chart

`helm install prometheus prometheus-community/kube-prometheus-stack`


# Launch Prometheus
`kubectl port-forward svc/prometheus-kube-prometheus-prometheus 19090:9090`

Access promethues at localhost:19090

## Grafana

Get password of grafana
 `kubectl get secret --namespace default prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`

`kubectl port-forward svc/prometheus-grafana 10080:80`

username: admin, pw: prom-operator
Access grafana at localhost:10080

# Ref

- https://www.youtube.com/watch?v=QoDqxm7ybLc
- https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/prometheus-exporter/install-prometheus-commands.md



