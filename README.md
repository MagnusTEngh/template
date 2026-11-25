# Template

Repository template for projects.

## Template CI

`.github/workflows/template-ci.yml` generates this repository as a new project with **all components enabled** and verifies that:

- the generated Python environment builds (`uv sync --all-groups`),
- the generated Nix flake evaluates and its default package builds (`nix flake check`, `nix build`),
- every prek hook passes in the generated project (`prek run -a`).

## Common

pre-commit boilerplate, which includes tools for each component if applicable.

## Prek

This template uses [Prek](https://github.com/prek/prek) for pre-commit hooks. Each hook can be run individually and set as required independently in GitHub workflows. Hooks are organized by component and only included if the component is active.

## Components 

Self contained components that can be toggled.

### Git

Adds Git configuration files including `.gitattributes` for file handling and `.gitmessage` for commit message templates.

### Agents

Adds some boilerplate skills and tools to enable efficient use of agents.

### Docs

Scaffolding for a detailed and structured docs/ folder using [Great Docs](https://github.com/posit-dev/great-docs).

**Note**: The Docs component can be used without Python, but Great Docs requires Python to function. If you enable Docs without Python, you will get the .qmd files but Great Docs build will not work. It is recommended to enable both Docs and Python components together.

**Features:**
- All existing docs/ content is included as the User Guide
- Test coverage results are displayed in the docs site at `/coverage/` (when Python is also enabled)
- Site is published to `https://<owner>.github.io/<repo>/`

**Local Usage (with Python):**
- Install [Quarto](https://quarto.org/) for rendering
- Install dependencies: `uv sync --all-groups`
- Build the site: `uv run great-docs build`
- Preview locally: `uv run great-docs preview`

**Local Usage (without Python):**
- Install [Quarto](https://quarto.org/) for rendering
- Use Quarto directly: `quarto render docs/`

**One-time setup**: Settings → Pages → Source: "GitHub Actions" (or `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`)

Adds architecture and ADR skeleton to build detailed and useful documentation. If agents are included, it adds a curator to help maintain the documentation.

### Nix

Adds a flake.nix file to fill out with the project dependencies and devshells.

Prek hooks:

- **nixfmt**: Formats Nix files
- **statix**: Lints Nix files for common issues
- **deadnix**: Checks for dead code in Nix files

### Python

Consists of a uv project boilerplate for the project.

Prek hooks:

- **ty**: Type checking with ty
- **pytest**: Runs Python tests
- **ruff**: Lints Python files
- **ruff-format**: Formats Python files

**Test Coverage:**

- Locally: `pytest`, then open `htmlcov/index.html`
- On GitHub: the coverage summary table appears on each workflow run page, PR runs upload the HTML as the `coverage-html` artifact, and pushes to main publish the full report to `https://<owner>.github.io/<repo>/coverage/`
- One-time setup for repos created from this template: Settings → Pages → Source: "GitHub Actions" (or `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`)
