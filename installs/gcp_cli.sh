#!/bin/bash

set -e  # Exit on any error

# -----------------------------
# Configurable installation directory
# -----------------------------
# Default: $HOME/google-cloud-sdk (standard location)
# You can override this when running the script like:
#   INSTALL_DIR=/opt/gcloud ./gcp_cli.sh
INSTALL_DIR="${INSTALL_DIR:-$HOME/google-cloud-sdk}"

# Temporary download directory (can also be overridden)
TMP_DIR="${TMP_DIR:-/tmp}"

echo "Installing Google Cloud CLI to: $INSTALL_DIR"
echo "Temporary files will be downloaded to: $TMP_DIR"
echo

# Detect OS and architecture
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "${ARCH}" in
    x86_64)
        ARCH_SUFFIX="x86_64"
        ;;
    aarch64|arm64)
        ARCH_SUFFIX="arm"
        ;;
    i386|i686)
        ARCH_SUFFIX="x86"
        ;;
    *)
        echo "Unsupported architecture: ${ARCH}"
        exit 1
        ;;
esac

case "${OS}" in
    linux)
        PLATFORM="linux-${ARCH_SUFFIX}"
        ;;
    darwin)
        PLATFORM="darwin-${ARCH_SUFFIX}"
        ;;
    *)
        echo "Unsupported OS: ${OS} (only Linux and macOS are supported for this installer)"
        exit 1
        ;;
esac

# Construct filename and URL
FILENAME="google-cloud-cli-${PLATFORM}.tar.gz"
DOWNLOAD_URL="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${FILENAME}"
DOWNLOAD_PATH="${TMP_DIR}/${FILENAME}"

echo "Detected platform: ${PLATFORM}"
echo "Downloading from: ${DOWNLOAD_URL}"
echo

# Download to temporary location
curl -L -o "${DOWNLOAD_PATH}" "${DOWNLOAD_URL}"

# Create install directory if it doesn't exist
mkdir -p "${INSTALL_DIR}"

# Extract directly into the target directory
echo "Extracting to ${INSTALL_DIR} ..."
tar -xzf "${DOWNLOAD_PATH}" -C "${INSTALL_DIR}" --strip-components=1

# Clean up the archive
rm -f "${DOWNLOAD_PATH}"

# Run the installer from the new location
echo "Running installer..."
"${INSTALL_DIR}/install.sh" \
    --usage-reporting=false \
    --path-update=true \
    --command-completion=true \
    --rc-path=$HOME/.zshrc \
    --quiet
