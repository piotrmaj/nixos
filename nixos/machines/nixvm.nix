{ lib, modulesPath, ... }:

{
  imports = [
        # note: this format can't be used with flakes, because it pulls from
        # NIX_PATH, which is impure, and dis-allowed with flakes.
        # Use the format shown in the line below it.

        #<nixpkgs/nixos/modules/installer/scan/not-detected.nix>

        "${modulesPath}/installer/scan/not-detected.nix"
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];
    };

    loader = {
      systemd-boot = {
        enable = true;
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  nix.maxJobs = lib.mkDefault 2;

  #virtualisation.virtualbox.guest.enable = true;

  networking.hostName = "nixvm";
}
