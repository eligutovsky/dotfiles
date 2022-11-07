#!/bin/bash
set -e pipefail
HomebrewInstall() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    echo "Installing Homebrew Casks..."
    brew bundle;
    echo "Homebrew and Casks installed"
}

ZshInstall() {
  echo "Installing ZSH shell"
  echo "Documentation: https://github.com/robbyrussell/oh-my-zsh"
  echo "Installing plugins..."
  git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
  git clone -q https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
  echo "Copying .zshrc file..."
  cp .zshrc $HOME/.zshrc;
}

# SETUP
echo "Setting up your Mac..."

HomebrewInstall || true
ZshInstall || true

echo "Setup complete. Please restart your terminal"
