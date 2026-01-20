.PHONY: help install serve build clean

# Variables
VENV_DIR := venv
PYTHON := python3
PIP := $(VENV_DIR)/bin/pip
MKDOCS := $(VENV_DIR)/bin/mkdocs
REQUIREMENTS := requirements.txt

# Default target
help:
	@echo "Cisco NSO Compliance Reporting Workshop - MkDocs Commands"
	@echo ""
	@echo "Available commands:"
	@echo "  make install    - Set up Python virtual environment and install dependencies"
	@echo "  make serve      - Start local development server at http://localhost:8000"
	@echo "  make build      - Build static site to site/ directory"
	@echo "  make clean      - Remove built files and Python cache"
	@echo "  make help       - Display this help message"
	@echo ""
	@echo "Quick Start:"
	@echo "  1. make install"
	@echo "  2. make serve"
	@echo "  3. Open http://localhost:8000 in your browser"
	@echo ""

# Install dependencies and set up virtual environment
install:
	@echo "Creating Python virtual environment..."
	@test -d $(VENV_DIR) || $(PYTHON) -m venv $(VENV_DIR)
	@echo "Installing dependencies from $(REQUIREMENTS)..."
	@$(PIP) install --upgrade pip
	@$(PIP) install -r $(REQUIREMENTS)
	@echo ""
	@echo "✓ Installation complete!"
	@echo ""
	@echo "Next steps:"
	@echo "  - Run 'make serve' to start the development server"
	@echo "  - Run 'make build' to build the static site"
	@echo ""

# Start local development server
serve: $(VENV_DIR)
	@echo "Starting MkDocs development server..."
	@echo "Open http://localhost:8000 in your browser"
	@echo "Press Ctrl+C to stop the server"
	@echo ""
	@$(MKDOCS) serve

# Build static site
build: $(VENV_DIR)
	@echo "Building MkDocs site..."
	@$(MKDOCS) build --strict
	@echo ""
	@echo "✓ Build complete!"
	@echo "  Static site generated in site/ directory"
	@echo ""

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	@rm -rf site/
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@echo "✓ Clean complete!"
	@echo ""

# Clean everything including virtual environment
clean-all: clean
	@echo "Removing virtual environment..."
	@rm -rf $(VENV_DIR)
	@echo "✓ Complete cleanup finished!"
	@echo ""

# Check if virtual environment exists
$(VENV_DIR):
	@echo "Virtual environment not found!"
	@echo "Run 'make install' first to set up the environment."
	@exit 1
