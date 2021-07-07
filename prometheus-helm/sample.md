

Ref: https://stackoverflow.com/questions/44461801/how-can-i-join-two-metrics-in-a-prometheus-query

sum(container_memory_working_set_bytes{namespace="vlab-jack"}) by (pod) 
   + on(pod) group_left(label_openanalytics_eu_sp_user_id,label_openanalytics_eu_sp_spec_id)
(
   0 * kube_pod_labels
)


(container_memory_usage_bytes{namespace="vlab-jack",metrics_path="/metrics/cadvisor", image!=""}) 
+ on (image, pod, namespace) 
(0*container_memory_usage_bytes{namespace="vlab-jack",metrics_path="/metrics/cadvisor"})



(container_memory_usage_bytes{namespace =~ "vlab.*",metrics_path="/metrics/cadvisor"}) 
+ on (image, pod, namespace,node) 
(0*container_memory_usage_bytes{namespace=~"vlab.*",metrics_path="/metrics/cadvisor"})