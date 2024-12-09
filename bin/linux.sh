#!/bin/bash  # Shebang to specify the script should be run with bash

# Check if the operating system is 'Linux' using the 'uname' command
if [ "$(uname)" != "Linux" ]; then  # If the output of 'uname' is not 'Linux'
  echo "Error: This script only works on Linux systems." >> linuxsetup.log  # Log error to linuxsetup.log
  exit 1  # Exit the script with a status code 1 (indicating an error)
fi

# Check if the '.TRASH' directory exists in the home directory
if [ ! -d "$HOME/.TRASH" ]; then  # If the '.TRASH' directory does not exist
  mkdir "$HOME/.TRASH"  # Create the '.TRASH' directory
  echo "Created .TRASH directory in home directory." >> linuxsetup.log  # Log the action
else
  echo ".TRASH directory already exists." >> linuxsetup.log  # Log if the directory already exists
fi

# Check if the '.nanorc' file exists in the home directory
if [ -f "$HOME/.nanorc" ]; then  # If the '.nanorc' file exists
  mv "$HOME/.nanorc" "$HOME/.bup nanorc"  # Rename '.nanorc' to '.bup nanorc'
  echo "The current .nanorc file was renamed to .bup nanorc." >> linuxsetup.log  # Log the renaming action
else
  echo "No .nanorc file found to rename." >> linuxsetup.log  # Log if the '.nanorc' file does not exist
fi

# Redirect the contents of '/etc/nanorc' to a new '.nanorc' file in the home directory
cp /etc/nanorc "$HOME/.nanorc"  # Copy the '/etc/nanorc' file to '$HOME/.nanorc'
echo "The contents of /etc/nanorc have been copied to .nanorc in the home directory." >> linuxsetup.log  # Log the action

# Append a statement to the end of the '.bashrc' file
echo "source $HOME/.dotfiles/etc/bashrc custom" >> "$HOME/.bashrc"  # Add the source statement to '.bashrc'
echo "Added 'source $HOME/.dotfiles/etc/bashrc custom' to the end of .bashrc." >> linuxsetup.log  # Log the action
