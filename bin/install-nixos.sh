#!/bin/sh

set -ex

MACHINE_NAME="nixvm"
cd /mnt/etc/github/nixos
# 🚀
nix-shell -p nixUnstable git --command "sudo nixos-install --flake \".#$MACHINE_NAME\" --impure --no-root-passwd --root /mnt"
