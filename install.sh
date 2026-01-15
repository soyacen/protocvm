#!/usr/bin/env bash

# Installation script for protocvm
# Clones protocvm to $HOME/.protocvm and sets up the environment

set -e

DEFAULT_PROTOCVM_DIR="$HOME/.protocvm"
PROTOCVM_DIR="${PROTOCVM_DIR:-$DEFAULT_PROTOCVM_DIR}"
GITHUB_REPO="https://github.com/soyacen/protocvm.git"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}INFO${NC}: $1"
}

log_warn() {
    echo -e "${YELLOW}WARN${NC}: $1"
}

log_error() {
    echo -e "${RED}ERROR${NC}: $1"
}

# Check if git is installed
if ! command -v git &>/dev/null; then
    log_error "git is required but not installed. Please install git first."
    exit 1
fi

# Check if curl or wget is available
if ! command -v curl &>/dev/null && ! command -v wget &>/dev/null; then
    log_error "Either curl or wget is required but not installed. Please install one of them first."
    exit 1
fi

# Check if protocvm is already installed
if [[ -d "$PROTOCVM_DIR" ]]; then
    log_warn "protocvm appears to be already installed at $PROTOCVM_DIR"
    log_warn "If you want to reinstall, please remove the directory first."
    exit 1
fi

log_info "Installing protocvm to $PROTOCVM_DIR"

# Clone the repository
git clone "$GITHUB_REPO" "$PROTOCVM_DIR"

# Make protocvm executable
chmod +x "$PROTOCVM_DIR/protocvm"

# Check if protocvm is in PATH
if ! command -v "$PROTOCVM_DIR/protocvm" &>/dev/null; then
    log_warn "protocvm is not in your PATH."
    echo
    echo "To get started, add the following line to your ~/.bashrc, ~/.zshrc, or ~/.profile:"
    echo ""
    echo "    export PATH=\"\$PATH:$PROTOCVM_DIR\""
    echo ""
    echo "Or source the profile file in your current session:"
    echo ""
    echo "    source ~/.bashrc  # or ~/.zshrc or ~/.profile"
    echo ""
fi

log_info "protocvm successfully installed!"
log_info "Run '$PROTOCVM_DIR/protocvm help' to get started."