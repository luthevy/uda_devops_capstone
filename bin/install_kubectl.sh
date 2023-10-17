#!/usr/bin/env bash
# Install kubectl if not installed
OS=$(uname | tr "[:upper:]" "[:lower:]")
COMMAND="kubectl"

# Install kubectl via specified link
test -e ./bin/${COMMAND} ||
    {
        curl -sSLo ./bin/${COMMAND} "https://dl.k8s.io/release/$(curl -L -s \
        https://dl.k8s.io/release/stable.txt)/bin/${OS}/amd64/kubectl"
        chmod +x ./bin/${COMMAND}
    }

echo "./bin/${COMMAND}: $(./bin/${COMMAND} version --client)"
