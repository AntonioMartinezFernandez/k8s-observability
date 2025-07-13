# k8s-observability

Observability system for K8s cluster and services

Disclaimer: It is intended for training purposes and **IT IS NOT SUITABLE FOR PRODUCTION USE**.

## Getting Started

1. `make spawn-cluster` to create a local cluster with kind
1. `kubectl port-forward svc/prometheus-grafana -n monitoring 3000:3000`
1. `./obserbaility-metrics.sh` to deploy prometheus and Grafana
1. Wait until all pods are running in the `monitoring` namespace (`kubectl get pods -n monitoring`)
1. `./observability-logs.sh` to deploy Loki and Promtail
1. Execute `kubectl run -n monitoring debug-pod --rm -i -t --image=alpine -- /bin/sh` to create a debug pod and run commands like `echo "Hello, Loki!"`
1. Port-forward the Grafana service with `kubectl port-forward svc/prometheus-grafana -n monitoring 3000:3000`
1. Access Grafana dashboard `http://localhost:3000` with user `admin` and the password printed by the observability metrics script
1. Add the Loki data source in Grafana with the URL `http://loki.monitoring.svc.cluster.local:3100`
1. Use the Grafana dashboard to visualize logs and metrics
1. `make destroy-cluster` to destroy the local cluster
