PROJECT_NAME := $(shell basename `pwd`)

.PHONY: clean clean-pyc clean-build lint install local run dist venv activate
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT


help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: clean-build clean-pyc ## remove all build and other Python artifacts

clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -rf {} +
	find . -name '*.egg' -exec rm -rf {} +

clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

lint: ## check style with ruff
	uv tool run ruff check

install: clean ## install packages
	uv sync --dev
	pre-commit install

local: ## Make local environment editable
	uv sync --dev
	uv pip install --editable . 

run: local ## Run main script
	uv run main.py

dist: clean # Create wheels/tar.gz distribution files
	uv build

venv: ## Create a Python3 virtualenv environment in .venv
	uv venv --prompt $(PROJECT_NAME)-venv

activate: ## Activating the virtual environment. Run `make venv` before activating.
	@echo "====================================================================="
	@echo "To activate the new virtual environment, execute the following from your shell"
	@echo "source .venv/bin/activate"

bump-dry: ## Bump up the patch version (dry-run)
	bump-my-version bump patch --dry-run -v