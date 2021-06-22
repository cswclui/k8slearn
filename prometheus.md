
# Setup
## Add repos
```

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

```

## Install chart

`kubectl create ns prometheus`
`helm install prometheus prometheus-community/kube-prometheus-stack -n prometheus`


# Launch Prometheus

Check services

`kubectl get svc -n prometheus`

`kubectl port-forward svc/prometheus-kube-prometheus-prometheus 19090:9090 -n prometheus`

Access promethues at localhost:19090

## Grafana

Get password of grafana.

 `kubectl get secret -n prometheus prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo`

`kubectl port-forward  -n prometheus  svc/prometheus-grafana 9999:80 `

username: admin, pw: prom-operator
Access grafana at localhost:9999

## Uninstall

`helm uninstall prometheus`

# Ref

- https://www.youtube.com/watch?v=QoDqxm7ybLc
- https://gitlab.com/nanuchi/youtube-tutorial-series/-/blob/master/prometheus-exporter/install-prometheus-commands.md
- https://hub.kubeapps.com/charts/prometheus-community/prometheus


