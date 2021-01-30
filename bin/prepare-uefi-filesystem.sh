#!/bin/sh

set -eux

# The size of the boot partition.
BOOT_SIZE=512MiB
# The size of swap partition.
SWAP_SIZE=8GiB

# Partition table using gpt as required by UEFI.
sudo -i parted $INSTALL_DRIVE_NAME -- mklabel gpt
# Primary partition
sudo -i parted $INSTALL_DRIVE_NAME -- mkpart primary $BOOT_SIZE -$SWAP_SIZE
# Swap partition
sudo -i parted $INSTALL_DRIVE_NAME -- mkpart primary linux-swap -$SWAP_SIZE 100%
# Boot partition
sudo -i parted $INSTALL_DRIVE_NAME -- mkpart ESP fat32 1MiB $BOOT_SIZE
# Enable the boot partition.
sudo -i parted $INSTALL_DRIVE_NAME -- set 3 esp on

# Format root partition
sudo -i mkfs.ext4 -L nixos ${INSTALL_DRIVE_NAME}1
# assign label for swap
sudo -i mkswap -L swap ${INSTALL_DRIVE_NAME}2
# Format the boot partition.
sudo -i mkfs.fat -F 32 -n boot ${INSTALL_DRIVE_NAME}3

# Wait for disk labels to be ready.
sleep 4

# Mount the primary & boot partitions.
sudo -i mount -o noatime /dev/disk/by-label/nixos /mnt
sudo -i mkdir /mnt/boot
sudo -i mount -o noatime /dev/disk/by-label/boot  /mnt/boot

# Prepare a directory to place files from github.
sudo -i mkdir -p /mnt/etc/github/nixos
sudo -i chown -R nixos /mnt/etc/github/nixos

# Prepare the directory to place the nix configuration.
sudo -i mkdir -p /mnt/etc/nixos
sudo -i chown -R nixos /mnt/etc/nixos