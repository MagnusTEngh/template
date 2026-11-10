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
