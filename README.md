# Dotfiles

This repository contains my dotfiles, which are managed and synchronized using GNU Stow.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) - Install using your package manager:

  ```bash
  # For Debian/Ubuntu
  sudo apt-get install stow

  # For macOS (with Homebrew)
  brew install stow
  ```

## Usage

  ```bash
  git clone https://github.com/ejjsharpe/.dotfiles.git
  cd .dotfiles
  stow *
  ```
