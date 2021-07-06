sum(container_memory_working_set_bytes{namespace="vlab-jack"}) by (pod) 
   + on(pod) group_left(label_openanalytics_eu_sp_user_id,label_openanalytics_eu_sp_spec_id)
(
   0 * kube_pod_labels
)

