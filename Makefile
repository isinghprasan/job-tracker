# Variables
BACKEND_DIR = backend
GO = go

# Default target
.PHONY: all
all: backend-build

# Backend targets
.PHONY: backend-build
backend-build:
	cd $(BACKEND_DIR) && $(GO) build -o bin/server main.go

.PHONY: backend-run
backend-run:
	cd $(BACKEND_DIR) && $(GO) run main.go

.PHONY: backend-test
backend-test:
	cd $(BACKEND_DIR) && $(GO) test ./...

.PHONY: backend-generate
backend-generate:
	cd $(BACKEND_DIR) && sqlc generate

# Clean target
.PHONY: clean
clean:
	rm -rf $(BACKEND_DIR)/bin

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all              - Build backend"
	@echo "  backend-build    - Build backend"
	@echo "  backend-run      - Run backend"
	@echo "  backend-test     - Run backend tests"
	@echo "  backend-generate - Generate SQLC code"
	@echo "  clean            - Clean build artifacts" 