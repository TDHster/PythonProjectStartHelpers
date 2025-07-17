#!/bin/sh/
# Display all python files content with path

find . -name '*.py' -type f -exec sh -c 'for f do echo "===== ${f#./} ====="; cat "$f"; done' sh {} +