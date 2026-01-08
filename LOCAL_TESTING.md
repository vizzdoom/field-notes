# Local Testing

## Prerequisites
- Python 3 and pip

## Install dependencies
```bash
python -m pip install -r requirements.txt
```

## Run local preview
```bash
python -m mkdocs serve --config-file mkdocs.yml --dev-addr 127.0.0.1:8000
```

## Build static output
```bash
python -m mkdocs build --config-file mkdocs.yml
```
