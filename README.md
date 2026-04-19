# Phycus - Public Haplotype Frequency Curation Service

Publish and index HFX (Haplotype Frequency Exchange) files with a searchable static table.

## Quick Start

1. Clone the repository
    ```bash
    git clone https://github.com/nmdp-bioinformatics/phycus.git
    cd phycus
    ```

2. Set up virtual environment and install
    ```bash
    make venv
    source .venv/bin/activate
    make install
    ```

3. Generate the static site
    ```bash
    uv run phycus --submission-dir submission --output-dir docs
    # or
    make run
    ```

4. View the generated site
    ```bash
    open docs/index.html
    ```

## Usage

### Add HFX Files

Place HFX files in the `submission/` directory:
- `.hfx` - HFX wheel/archive files (ZIP with metadata.json inside)
- `.hfx-metadata.json` - Raw HFX metadata JSON files

### Generate Site

```bash
# Default directories
uv run phycus

# Custom directories
uv run phycus --submission-dir my-submissions --output-dir public
```

### Features

- **Search** - Full-text search across all fields
- **Filters** - Filter by species, data source
- **Sort** - Click column headers to sort
- **Responsive** - Works on mobile and desktop

## GitHub Integration

The workflow in `.github/workflows/build.yml` automatically:
- Runs when files in `submission/` change
- Generates updated `docs/index.html`
- Uploads as artifact on PR for preview
- Auto-commits to main on push

## Deployment to GitHub Pages

1. Enable GitHub Pages in repository settings:
   - Go to **Settings → Pages**
   - Select **Deploy from a branch**
   - Select branch: `main`
   - Select folder: `/docs`
   - Save

2. Your site will be published at:
   ```
   https://nmdp-bioinformatics.github.io/phycus/
   ```

3. View the generated site:
   - **In a PR**: Check the "Artifacts" section of the GitHub Actions run
   - **On main**: Visit the GitHub Pages URL above

## Development

```bash
# Run linter
make lint

# Run pre-commit hooks
pre-commit run --all-files

# Clean build artifacts
make clean
```


## Make Commands

```bash
make help        # Show all targets
make venv        # Create virtual environment
make install     # Install dependencies
make run         # Generate site
make lint        # Check code style
make clean       # Remove artifacts
```
