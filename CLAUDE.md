# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Omarchy is an Arch Linux system configuration tool that transforms a fresh Arch installation into a fully-configured, modern web development system based on Hyprland. It's an opinionated desktop environment setup inspired by Omakub.

## Architecture

The project follows a modular installation architecture organized around phases:

- **Preflight** (`install/preflight/`): System validation, AUR helper setup, and migrations
- **Configuration** (`install/config/`): System-level settings (network, power, keyboard, NVIDIA, etc.)  
- **Development** (`install/development/`): Terminal tools, development environments, Docker, firewall
- **Desktop** (`install/desktop/`): Hyprland desktop environment, themes, fonts, Bluetooth
- **Applications** (`install/apps/`): Web apps, extra applications, MIME types

### Key Components

- **Entry Points**: `boot.sh` (initial bootstrap), `install.sh` (main installer)
- **Configuration Templates**: `default/` contains base configs, `config/` has user overrides
- **Themes**: `themes/` directory with complete theme packages (colors, wallpapers, app configs)
- **Migrations**: Timestamped migration scripts in `migrations/` for system updates

### Installation Flow

1. `boot.sh` - Downloads repo, sets up environment
2. `install.sh` - Orchestrates the full installation across 5 phases
3. Each phase sources multiple specialized scripts from `install/` subdirectories

## Common Commands

### Installation
```bash
# Full installation (from fresh Arch system)
bash <(curl -s https://omarchy.org/boot)

# Retry installation if it failed
bash ~/.local/share/omarchy/install.sh

# Use custom repo/branch
OMARCHY_REPO="username/fork" bash <(curl -s https://omarchy.org/boot)
OMARCHY_REF="feature-branch" bash <(curl -s https://omarchy.org/boot)
```

### Development Tools Available
- **Git**: `git`, `gh` (GitHub CLI), `lazygit`
- **Languages**: `cargo` (Rust), `clang`/`llvm` (C/C++), `mise` (version manager)
- **Terminal**: `fd`, `eza`, `fzf`, `ripgrep`, `zoxide`, `bat`, `jq`, `zsh` (default shell with zinit)
- **Browsers**: `chromium`, `zen-browser-bin`
- **Docker**: `docker`, `lazydocker`

### File Structure Conventions
- Config files use standard XDG directories via `config/` folder
- Default configs are in `default/`, user overrides in `config/`
- Shell configs available for both bash (`default/bash/`) and zsh (`default/zsh/`) 
- Each installation script is self-contained and uses `yay` for package management
- All scripts use `set -e` for strict error handling

## Development Practices

- Shell scripts use strict error handling (`set -e`)
- Package installation uses `yay -S --noconfirm --needed`
- Guard checks ensure compatibility (Arch-only, x86_64, no existing DEs)
- Migrations are timestamped and run automatically during install
- All configs are symlinked from the repo to maintain version control

## ZSH Configuration

- **Plugin Manager**: zinit (auto-installed on first run)
- **Core Plugins**:
  - `zsh-users/zsh-syntax-highlighting` - Command syntax highlighting
  - `zsh-users/zsh-completions` - Additional completion definitions
  - `zsh-users/zsh-autosuggestions` - Command autosuggestions from history
  - `Aloxaf/fzf-tab` - Enhanced tab completion with fzf
- **Enhanced Features**:
  - Git-aware prompt with branch status and file indicators
  - Colorized directory listing in completions
  - History-based and completion-based autosuggestions

## Theme System

Themes in `themes/` are complete packages containing:
- Application configs (alacritty, btop, waybar, etc.)
- Wallpapers in `backgrounds/` subdirectory  
- Color schemes for all supported applications
- Light/dark mode variants where applicable