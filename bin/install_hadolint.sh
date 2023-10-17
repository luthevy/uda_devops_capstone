#!/usr/bin/env bash
# Install hadolint if not installed 
HADOLINT_FILE=https://github.com/hadolint/hadolint/releases/download/v2.10.0/hadolint-Linux-x86_64

# Install hadolint via specified link
test -e ./bin/hadolint ||
  {
    wget -qO ./bin/hadolint "${HADOLINT_FILE}"
    chmod +x ./bin/hadolint
  }

echo "./bin/hadolint: $(./bin/hadolint --version)"
