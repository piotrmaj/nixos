
{ lib, pkgs, ... }:

let
  settings = import ../settings.nix;

in {
  # services = {
  #   dbus = {
  #     enable = true;

  #     packages = with pkgs; [
  #       gnome3.dconf
  #     ];
  #   };
    
  #   xserver = {
  #     enable = true;

  #     desktopManager = {
  #       xterm.enable = false;
  #       gnome3.enable = true;
  #     };

  #     displayManager = {
  #       # Skip login since we just unlocked the encrypted drive.
  #       autoLogin = {
  #         enable = true;
  #         user = settings.user.username;
  #       };

  #       gdm ={
  #         enable = true;
  #       };
  #     };

  #     # Turn caps lock into another ctrl.
  #     xkbOptions = "ctrl:nocaps";
  #   };
  # };
  services = {
    xserver = {
      enable = true;
      layout = "us";
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome3.enable = true;
    };

    dbus.packages = [ pkgs.gnome3.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };
}
