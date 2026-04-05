#!/bin/bash

set -e

INSTALL_DIR="${INSTALL_DIR:-$HOME/google-cloud-sdk}"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "${ARCH}" in
    x86_64)       ARCH_SUFFIX="x86_64" ;;
    aarch64|arm64) ARCH_SUFFIX="arm" ;;
    i386|i686)    ARCH_SUFFIX="x86" ;;
    *)            echo "Unsupported architecture: ${ARCH}"; exit 1 ;;
esac

case "${OS}" in
    linux)  PLATFORM="linux-${ARCH_SUFFIX}" ;;
    darwin) PLATFORM="darwin-${ARCH_SUFFIX}" ;;
    *)      echo "Unsupported OS: ${OS}"; exit 1 ;;
esac

FILENAME="google-cloud-cli-${PLATFORM}.tar.gz"
DOWNLOAD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${FILENAME}"
DOWNLOAD_PATH="/tmp/${FILENAME}"

echo "Installing Google Cloud CLI (${PLATFORM}) to ${INSTALL_DIR}"

curl -L -o "${DOWNLOAD_PATH}" "${DOWNLOAD_URL}"
mkdir -p "${INSTALL_DIR}"
tar -xzf "${DOWNLOAD_PATH}" -C "${INSTALL_DIR}" --strip-components=1
rm -f "${DOWNLOAD_PATH}"

"${INSTALL_DIR}/install.sh" \
    --usage-reporting=false \
    --path-update=true \
    --command-completion=true \
    --rc-path=$HOME/.zshrc \
    --quiet
