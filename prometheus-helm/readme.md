Create `stack-values.yaml`:
```
additionalScrapeConfigs: 
  - job_name: 'shinyproxy'
    metrics_path: '/actuator/prometheus'
    static_configs:
      # note: this is the port of ShinyProxy Actuator services, not the port of Prometheus which is by default also 9090
      - targets: ['shinyproxy.shinyproxy.svc.cluster.local:9090'] 
```


Execute:
`helm upgrade  --install prometheus prometheus-community/kube-prometheus-stack -n prometheus -f stack-values.yaml`



Shinyproxy service manifest:
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
localhost:32095/actuator/prometheus