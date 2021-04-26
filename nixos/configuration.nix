
{ lib, pkgs, ... }:

let
  settings = import ./settings.nix;

in {
  system.stateVersion = "20.09";

  imports = [
    <home-manager/nixos>
    ./xserver/xserver.nix
  ];

  nixpkgs = {
    overlays = [
      (import ./pkgs/default.nix)
    ];

    # Allow unfree programs to be installed.
    config = {
      allowUnfree = true;
    };
  };

  time.timeZone = "Europe/Warsaw";

  hardware = {
    # Enable sound.
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };
  };

  networking = {
    # Detect and manage network connections.
    networkmanager = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # Command line utilities.
    exfat # mount exfat drives.
    ethtool # ethernet debugging.
    glxinfo # gfx debugging.
    lm_sensors # system sensor access.
    nfs-utils # mount nfs drives.
    pciutils # pci debugging.
    usbutils # usb debugging.
    libfido2 # fido2/webauthn authentication.
    unzip #unzip
    jq # json parser
    silver-searcher # code searching-tool, find in all
    tree # file tree
    omnisharp-roslyn # required for omnisharp-vim to have c# intellisense and more
    docker_compose # for running docker-compose
  ] ++ [
    # X11 utilities.

    arandr # Detect and manage multiple monitors.
    chromium # Web browser.
    pavucontrol # Detect and manage audio devices.
  ];

  fonts = {
    fonts = with pkgs; [
      source-code-pro
      source-sans-pro
      source-serif-pro
      font-awesome
      nerdfonts
      (
        nerdfonts.override {
          fonts = [ "FiraCode" "Meslo" ];
        }
      )
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif     = [ "Source Serif Pro" ];
      };
    };
  };

  virtualisation.docker = {
    enable = true;

    autoPrune = {
      enable = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      root = {
        hashedPassword = settings.user.hashedPassword;
      };

      ${settings.user.username} = {
        isNormalUser = true;
        extraGroups = [
          "wheel" # Enable sudo.
          "video" # Enable changing screen settings without sudo.
          "docker" # Enable using docker without sudo.
          "networkmanager" # Enable changing network settings without sudo.
        ];
        hashedPassword = settings.user.hashedPassword;
      };
    };
  };

  # Automount NAS NFS volumes on demand.
  fileSystems = {
    "/nas/git" = {
      device = "//192.168.0.52/git";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
    };
    /*"/nas/media" = {
      device = "192.168.1.200:/mnt/storage/media";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };
    "/nas/photos" = {
      device = "192.168.1.200:/mnt/storage/photos";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };*/
  };

  home-manager.users.root = { pkgs, ... }: {
    nixpkgs = {
      overlays = [
        (import ./pkgs/default.nix)
      ];
    };

    /*imports = [
      ./home/terminal/basic.nix
    ];*/
  };

  home-manager.users.${settings.user.username} = { ... }: {
    nixpkgs = {
      overlays = [
        (import ./pkgs/default.nix)
      ];
      config.allowUnfree = true;

      # Allow certain unfree programs to be installed.
      config = {
        allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
         # "discord"
         # "faac"
         # "postman"
         # "slack"
          "spotify"
         # "steam"
         # "steam-original"
         # "steam-runtime"
         # "zoom-us"
        ];
      };
    };

    imports = [
      ./home/terminal/basic.nix
      ./home/desktop/basic.nix
      ./home/desktop/keys.nix
      ./home/programs/default.nix
    ];
  };
}
