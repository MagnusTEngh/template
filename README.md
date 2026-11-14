# Template

Repository template for projects.

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

Adds architecture and ADR skeleton to build detailed and useful documentation. If agents are included, it adds a curator to help maintain the documentation.

**Local Usage:**

- Install [Quarto](https://quarto.org/) for rendering
- `uv sync --all-groups` to install great-docs
- `uv run great-docs build` to build the site
- `uv run great-docs preview` to preview locally

**Features:**
- All existing docs/ content is included as the User Guide
- Test coverage results are displayed in the docs site at `/coverage/`
- Site is published to `https://<owner>.github.io/<repo>/`
- One-time setup: Settings → Pages → Source: "GitHub Actions" (or `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`)

### Nix

Adds a flake.nix file to fill out with the project dependencies and devshells.

Prek hooks:

- **nixfmt**: Formats Nix files
- **statix**: Lints Nix files for common issues
- **deadnix**: Checks for dead code in Nix files

### Python

Consists of a uv project boilerplate for the project.

**Requirements:**
- Install [Quarto](https://quarto.org/) for Great Docs rendering

Prek hooks:

- **ty**: Type checking with ty
- **pytest with coverage**: Runs tests with coverage on pre-push
- **ruff**: Lints Python files
- **ruff-format**: Formats Python files

**Test Coverage:**

- Locally: `uv sync`, `uv tool install prek`, then `prek install --hook-type pre-commit --hook-type pre-push`. Tests run on push, or manually via `prek run --all-files --hook-stage pre-push`; open `htmlcov/index.html` afterwards.
- On GitHub: the coverage summary table appears on each workflow run page, PR runs upload the HTML as the `coverage-html` artifact, and pushes to main publish the full report to `https://<owner>.github.io/<repo>/coverage/`.
- One-time setup for repos created from this template: Settings → Pages → Source: "GitHub Actions" (or `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`).

### Renovate

Adds a [Renovate](https://docs.renovatebot.com/) configuration file for automated dependency updates.

**Features:**
- All levels refuse updates newer than 7 days and group dependencies together
- When the **Nix** component is also enabled, Renovate will maintain Nix flake files
- When the **Python** component is also enabled, Renovate will maintain Python dependencies (pyproject.toml, uv.lock, etc.)

**Configuration Levels:**

- **minimal**: Only opens PRs, does NOT auto-merge. All updates newer than 7 days are refused and grouped.
- **patch**: Auto-merges patch updates. All updates newer than 7 days are refused and grouped.
- **minor**: Auto-merges patch and minor updates. All updates newer than 7 days are refused and grouped.
- **yolo**: Auto-merges ALL updates (patch, minor, major). All updates newer than 7 days are refused and grouped.
