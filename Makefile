.DEFAULT_GOAL := help

# -----------------------------------
# Recipes
# -----------------------------------
.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup:
    mkdir -p /var/www/html/ecovet.cloud/shared/log
    mkdir -p /var/www/html/ecovet.cloud/shared/tmp/cache
    mkdir -p /var/www/html/ecovet.cloud/shared/tmp/pids
    mkdir -p /var/www/html/ecovet.cloud/shared/tmp/sockets
    mkdir -p /var/www/html/ecovet.cloud/shared/config
