# Setup 


Create `stack-values.yaml`:
```
additionalScrapeConfigs: 
  - job_name: 'shinyproxy'
    metrics_path: '/actuator/prometheus'
    static_configs:
      # note: this is the port of ShinyProxy Actuator services, not the port of Prometheus which is by default also 9090
      - targets: ['shinyproxy.shinyproxy.svc.cluster.local:9090'] 
```

Install prometheus, grafana, and enable setup shinyproxy scrapconfig for prometheus.


`helm upgrade  --install prometheus prometheus-community/kube-prometheus-stack -n prometheus -f stack-values.yaml`



Deploy Shinyproxy service to expoese port 8080 and 9090.

```
kind: Service
apiVersion: v1
metadata:
  name: shinyproxy
spec:
  type: NodePort
  selector:
    run: shinyproxy
  ports:
  - protocol: TCP
    port: 8080
    name: http
    targetPort: 8080
    nodePort: 32094
  - protocol: TCP
    port: 9090
    name: metrics
    targetPort: 9090
    nodePort: 32095
```

Prometheus metrics is available at 
[nodeIP]:32095/actuator/prometheus


# Reference:

- Helm chart: https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack
