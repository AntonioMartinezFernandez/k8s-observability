#!/bin/bash

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install loki grafana/loki-stack --namespace monitoring -f loki-values.yaml
helm upgrade --install promtail grafana/promtail --namespace monitoring -f promtail-values.yaml