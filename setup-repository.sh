#!/bin/bash

set -e

echo "Setting up the repository..."

# Detect OS
OS=$(uname -s)
echo "Detected OS: $OS"

# Install dependencies
if [[ "$OS" == "Darwin" ]]; then
  echo "Installing dependencies for macOS..."
  brew install asdf
elif [[ "$OS" == "Linux" ]]; then
  echo "Installing dependencies for Linux..."
  sudo apt update
  sudo apt install -y curl git
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
  echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
  echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc
  source ~/.bashrc
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# Install Node.js via asdf
echo "Installing Node.js via asdf..."
asdf plugin add nodejs || true
asdf install nodejs latest
asdf global nodejs latest

# Install pnpm
echo "Installing pnpm..."
npm install -g pnpm

# Verify installation
echo "Verifying installation..."
node -v
npm -v
pnpm -v

echo "Setup complete!"
