# Get the currently used golang install path (in GOPATH/bin, unless GOBIN is set)
ifeq (,$(shell go env GOBIN))
GOBIN=$(shell go env GOPATH)/bin
else
GOBIN=$(shell go env GOBIN)
endif

##@ Development
spawn-cluster:
	@echo "Creating cluster..."
	kind create cluster --name k8s-observability --config ./kind-cluster.yaml

destroy-cluster:
	@echo "Destroying cluster..."
	kind delete cluster --name k8s-observability
