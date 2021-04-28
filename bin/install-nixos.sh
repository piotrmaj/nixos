#!/bin/sh

set -ex

nix-shell -p nixUnstable git \
    --command 'cd /mnt/etc/github/nixos && sudo nixos-install --flake ".#nixvm" --no-root-passwd'

#sudo rm -rf /mnt/etc/github/nixos/
#sudo git clone --branch flakes https://github.com/piotrmaj/nixos
#cd nixos
#sudo nixos-install --flake ".#nixvm"


#sleep 5h

# # Select the machine to install.
# ln -s /mnt/etc/github/nixos/machines/nixvm.nix /mnt/etc/nixos/configuration.nix

# # 🚀
# sudo -i nixos-install --no-root-passwd