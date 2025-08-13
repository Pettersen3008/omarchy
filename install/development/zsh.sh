#!/bin/bash

# Install zinit (zsh plugin manager)
if [ ! -d "$HOME/.local/share/zinit/zinit.git" ]; then
  echo "Installing zinit..."
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi