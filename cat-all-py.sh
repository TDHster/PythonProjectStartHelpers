#!/bin/sh/
# Display all python files content with path

find . -type f -name "*.py" \
  ! -path "./.git/*" \
  ! -exec git check-ignore -q {} \; \
  -exec sh -c 'echo "===== $1 ====="; cat "$1"' _ {} \;
