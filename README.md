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

Scaffolding for a detailed and structured docs/ folder.

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

- Run locally: `pytest`, then open `htmlcov/index.html` in your browser
- On GitHub: the coverage summary table appears on each workflow run page
- PR runs upload the HTML report as the `coverage-html` artifact
- Pushes to main publish the full report to `https://<owner>.github.io/<repo>/`
- One-time setup for repos created from this template: Settings → Pages → Source: "GitHub Actions" (or `gh api -X POST repos/<owner>/<repo>/pages -f build_type=workflow`)

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
