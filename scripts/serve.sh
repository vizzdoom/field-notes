#!/usr/bin/env bash
set -euo pipefail

ADDR="${1:-127.0.0.1:8000}"
python -m mkdocs serve --config-file mkdocs.yml --site-dir site --dev-addr "$ADDR"
