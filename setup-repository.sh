#!/bin/bash

set -e

echo "Setting up the repository..."

# Detect OS
OS=$(uname -s)
echo "Detected OS: $OS"

# Install dependencies
if [[ "$OS" == "Darwin" ]]; then
  echo "Checking dependencies for macOS..."
  if ! command -v asdf &> /dev/null; then
    echo "Installing asdf..."
    brew install asdf
  else
    echo "asdf is already installed."
  fi
elif [[ "$OS" == "Linux" ]]; then
  echo "Checking dependencies for Linux..."
  if ! command -v asdf &> /dev/null; then
    echo "Installing asdf..."
    sudo apt update
    sudo apt install -y curl git
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
    source ~/.bashrc
  else
    echo "asdf is already installed."
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# Install Node.js via asdf
if ! command -v node &> /dev/null; then
  echo "Installing Node.js via asdf..."
  asdf plugin add nodejs || true
  asdf install nodejs latest
  asdf global nodejs latest
else
  echo "Node.js is already installed."
fi

# Install pnpm
if ! command -v pnpm &> /dev/null; then
  echo "Installing pnpm..."
  npm install -g pnpm
else
  echo "pnpm is already installed."
fi

# Verify installation
echo "Verifying installation..."
node -v
npm -v
pnpm -v

echo "Setup complete!"
