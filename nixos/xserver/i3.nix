
{ lib, pkgs, ... }:

let
  settings = import ../settings.nix;

in {
  services = {
    # not really sure if it's needed for i3
    dbus = {
      enable = true;

      packages = with pkgs; [
        gnome3.dconf
      ];
    };
    
    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
        # Skip login since we just unlocked the encrypted drive.
        autoLogin = {
          enable = true;
          user = settings.user.username;
        };

        lightdm = {
          enable = true;
        };
      };

      windowManager = {
        i3 = {
          enable = true;
        };
      };

      # Turn caps lock into another ctrl.
      xkbOptions = "ctrl:nocaps";
    };
  };
}
