#!/bin/bash
DOTFILES_DIR="$HOME/.dotfiles"

# Install Homebrew 
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed."
fi

# Install dependencies from the Brewfile
if [ -f "$DOTFILES_DIR/brew/Brewfile" ]; then
  echo "Installing dependencies from Brewfile..."
  brew bundle --file="$DOTFILES_DIR/brew/Brewfile" --no-lock
else
  echo "No Brewfile found in $DOTFILES_DIR. Skipping dependency installation."
fi

# Install Oh My Zsh 
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh is already installed."
fi

# Install Powerlevel10k theme 
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "Powerlevel10k is already installed."
fi

# Install NVM if not installed
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM..."
  brew install nvm

  # Ensure NVM is properly set up
  mkdir -p "$HOME/.nvm"
  {
    echo 'export NVM_DIR="$HOME/.nvm"'
    echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'
    echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"'
  } >> "$HOME/.zshrc"

  echo "NVM installed. Restart your terminal or run 'source ~/.zshrc' to apply changes."
else
  echo "NVM is already installed."
fi

# Use Stow to link all dotfiles
echo "Syncing dotfiles with Stow..."
cd "$DOTFILES_DIR"
stow nvim zsh

echo "Installation and setup complete! Restart your terminal or run 'source ~/.zshrc' to apply changes."