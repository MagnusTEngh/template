# Prek Hooks

This directory contains Prek configuration and hooks for the project.

## Structure

Each hook is defined as a separate script in the `hooks/` directory and can be run individually.

## Available Hooks

### Always Present

- **markdownlint**: Lints markdown files for style and consistency

### Nix Component (if enabled)

- **nixfmt**: Formats Nix files
- **statix**: Lints Nix files for common issues
- **deadnix**: Checks for dead code in Nix files

### Python Component (if enabled)

- **ty**: Type checking with ty
- **pytest**: Runs Python tests
- **ruff**: Lints Python files
- **ruff-format**: Formats Python files

## Usage

### Local Development

Run all hooks:
```bash
prek run
```

Run specific stage:
```bash
prek run --stage nix
prek run --stage python
prek run --stage always
```

Run specific hook:
```bash
prek run --hook nixfmt
prek run --hook ruff
```

### GitHub Actions

Each hook can be run individually in GitHub workflows. See `.github/workflows/prek.yml` for examples.

## Configuration

The `prek.yaml` file is generated based on the selected components. Hooks are only included if their corresponding component is active.
