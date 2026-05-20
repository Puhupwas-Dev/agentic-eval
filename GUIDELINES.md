# Internal Development Notes

Personal guidelines for building reference implementations in this repository.

## Repository Naming

Choose a concise name that reflects the main topic. Avoid generic terms like `workshop`, `bootcamp`, `reference`, or `implementations`. Use a single descriptive topic name.

**Example:** `retrieval-augmented-generation` for RAG examples.

## Environment Variables

Use a `.env` file for environment variables. Access them with `os.getenv("VAR", "default")`. Provide a `.env.example` with placeholder values.

## Utility Packages

Place common methods and classes in a dedicated module at the root. Each package should have its own `pyproject.toml`. Link packages in the main `pyproject.toml`:

```toml
[tool.uv.workspace]
members = ["aieng-topic-impl"]

[tool.uv.sources]
aieng-topic-impl = { workspace = true }
For testing, use pre‑release versions (v0.1.0a1). After testing, update to release version (v1.0.0).

Google Colab Integration (For Notebooks)
If notebooks are meant to run on Colab, add a badge at the top:

markdown
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/username/repo-name/blob/main/notebook.ipynb)
Add a Python cell to detect Colab and install dependencies:

python
import os
if "COLAB_RELEASE_TAG" in os.environ:
    !pip3 install numpy==1.26.4 torchvision==0.16.2 your-package
    !pip3 uninstall --yes conflicting-package
Dockerization
Use Docker for portability and consistency.

Update the Dockerfile as needed.

Modify scripts/start.sh to run setup steps.

Update README.md with build and run instructions.

GitHub Actions
Publishing Packages
To publish packages to PyPI, create a PyPI token and store it as the PYPI_API_TOKEN secret in repository settings. Create a GitHub Release and push a new tag (e.g., v0.1.0) to trigger the publish workflow.

After publishing, test the package in a fresh virtual environment.
