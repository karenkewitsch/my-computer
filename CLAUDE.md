# my-computer

Personal dotfiles and system setup manager for provisioning new machines (macOS and Linux/Omarchy).

## How it works

- **GNU Stow** symlinks config files from `dotfiles/` into their target locations (mostly `$HOME`, but not exclusively — e.g. `webapps_omarchy` targets a system directory)
- Stow packages: `home_common`, `home_mac`, `home_omarchy`, `webapps_omarchy`
- Install scripts are idempotent — they check for existing tools before installing

## Setup order

1. OS-specific installs: `installs_mac.zsh` or `installs_omarchy.sh`
2. Common installs: `. installs_common.sh` (uv, zsh plugins, GCP CLI)
3. GitHub SSH: `bash installs/github_ssh.sh`
4. Stow dotfiles: `cd dotfiles && stow home_common && stow home_mac` (or `home_omarchy`)

## Key conventions

- Shell functions live in `dotfiles/home_common/.bash_funcs/`, one file per concern (git, python, aws, gcp, dotenv)
- Platform-specific `.zshrc_include.zsh` sources the shared `.zshrc_common.zsh`
- Git config uses `includeIf` to swap email for work repos under `~/aro/`
- Install scripts should remain idempotent — always guard with `command -v` or equivalent checks

## Platforms

- **macOS**: Homebrew packages, AeroSpace tiling WM, Alacritty terminal
- **Linux (Omarchy/Arch)**: Pacman packages, web app .desktop launchers

## Tools configured

Shell (zsh + starship + fzf), Alacritty, VS Code, Git, AWS CLI, GCP CLI, Python (uv), Rust
