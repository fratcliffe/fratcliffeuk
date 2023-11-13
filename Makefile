.DEFAULT_GOAL := help

CLUSTER_NAME:=fratcliffe-uk

.PHONY: tilt-up
tilt-up: ## Create a KIND cluster and start Tilt in foreground
	@kind get clusters | grep -q ${CLUSTER_NAME} || kind create cluster --name ${CLUSTER_NAME}
	@cd tilt && tilt up

.PHONY: tilt-down
tilt-down: ## Delete kind cluster used for tilt
	@kind delete cluster --name ${CLUSTER_NAME}

.PHONY: help
help: ## Display this help
###& Example: Additional information about help target usage
	@echo "\nUsage:\n  make \033[36m<target>\033[0m"
	@awk 'BEGIN {FS = ":.*##"}; \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } \
		/^###@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } \
		/^###&/ { printf "\t\t  \033[33m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
##@ To add more information to the help output, see the example provided in help target
