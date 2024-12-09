#!/bin/bash  # Shebang to specify the script should be run with bash

# Step 3: Remove the '.nanorc' file from the home directory
if [ -f "$HOME/.nanorc" ]; then  # Check if '.nanorc' exists in the home directory
  rm "$HOME/.nanorc"  # Remove the '.nanorc' file
  echo "Removed .nanorc file from home directory."  # Log the action
else
  echo "No .nanorc file found to remove."  # Log if '.nanorc' doesn't exist
fi

# Step 4: Remove the line 'source ∼/.dotfiles/etc/bashrc custom' from the '.bashrc' file
sed -i '/source ~\/.dotfiles\/etc\/bashrc custom/d' "$HOME/.bashrc"  # Use sed to delete the line from '.bashrc'
echo "Removed 'source ~/.dotfiles/etc/bashrc custom' from .bashrc."  # Log the action

# Step 5: Remove the '.TRASH' directory from the home directory
if [ -d "$HOME/.TRASH" ]; then  # Check if '.TRASH' directory exists
  rm -r "$HOME/.TRASH"  # Remove the '.TRASH' directory
  echo "Removed .TRASH directory from home directory."  # Log the action
else
  echo "No .TRASH directory found to remove."  # Log if '.TRASH' directory doesn't exist
fi
