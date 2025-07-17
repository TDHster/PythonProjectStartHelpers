#!/bin/sh/
# Display all python files content with path

find . -type f -name "*.py" -not -path "./venv/*" -exec sh -c 'echo "===== $1 ====="; cat "$1"' _ {} \;
