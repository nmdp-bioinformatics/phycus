# Project Template for Python Scripts

## How to use the template:

Create a template by clicking on the "Use this template" button and select "Create a new repository"
   This will create a new repository with the given name e.g. `urban-potato`.

## Clone and Run the template

1. Clone the repository locally
    ```shell
    git clone https://github.com/pbashyal-nmdp/urban-potato.git
    cd urban-potato
    ```
2. Make a virtual environment by running `make venv`
   ```shell
    > make venv
    uv venv --prompt urban-potato-venv
    Using CPython 3.13.0
    Creating virtual environment at: .venv
    Activate with: source .venv/bin/activate
   ```
3. Source the virtual environment
   ```shell
   source .venv/bin/activate
   ```
4. Install dependencies
    ```shell
    make install
    ```

## Make commands

Development workflow is driven through `Makefile`. Use `make` to list show all targets.
```
> make
clean                remove all build and other Python artifacts
clean-build          remove build artifacts
clean-pyc            remove Python file artifacts
lint                 check style with ruff
install              install packages
local                Make local environment editable
run                  Run main script
venv                 Create a Python3 virtualenv environment in .venv
activate             Activating the virtual environment. Run `make venv` before activating.
bump-dry             Bump up the patch version (dry-run)
```