# {{ project_name }}

{% if 'nix' in components or 'python' in components %}
## Prek

This project uses [Prek](https://github.com/prek/prek) for pre-commit hooks. Each hook can be run individually and set as required independently in GitHub workflows.

{% endif %}
{% if 'nix' in components %}
## Nix

Prek hooks:

- **nixfmt**: Formats Nix files
- **statix**: Lints Nix files for common issues
- **deadnix**: Checks for dead code in Nix files

{% endif %}
{% if 'python' in components %}
## Python

Prek hooks:

- **ty**: Type checking with ty
- **pytest**: Runs Python tests
- **ruff**: Lints Python files
- **ruff-format**: Formats Python files

{% endif %}
