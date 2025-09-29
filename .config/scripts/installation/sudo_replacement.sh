#!/bin/bash

paru -S --noconfirm --needed doas

if ! rg -q "^IgnorePkg" /etc/pacman.conf; then
    echo "IgnorePkg = sudo" | sudo tee -a /etc/pacman.conf
else
    sudo sed -i '/^IgnorePkg/ { /sudo/! s/$/ sudo/ }' /etc/pacman.conf
fi

DOAS_PATH=/usr/bin/doas
SUDO_LINK=/usr/bin/sudo
CONF_FILE="/etc/doas.conf"
PERMIT_LINE="permit :wheel"

# Ensure the config file exists
if [ ! -f $CONF_FILE ]; then
    echo "Config file not found. Creating $CONF_FILE..."
    sudo touch "$CONF_FILE"
fi

# Add permit line if missing
if sudo rg -qxF "$PERMIT_LINE" $CONF_FILE; then
    echo "$PERMIT_LINE already present in $CONF_FILE"
else
    echo "Adding $PERMIT_LINE to $CONF_FILE"
    echo $PERMIT_LINE | sudo tee -a $CONF_FILE >/dev/null
    echo "Added successfully."
fi

# Remove sudo if not already removed
if [ -e $SUDO_LINK ] || [ -L $SUDO_LINK ]; then
    echo "Removing existing $SUDO_LINK"
    paru -Rdd --noconfirm sudo
fi

# Create new symlink
echo "Creating symlink $SUDO_LINK that points to $DOAS_PATH"
doas ln -s "$DOAS_PATH" "$SUDO_LINK"
echo "sudo successfully replaced with doas"
