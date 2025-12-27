{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };
  security.pam.services = {
    # Depending on which screen locker you are using, as per
    # https://github.com/NixOS/nixpkgs/pull/399051/files#diff-aef862f6fd2c25092a3f17f974d8757285bf7baff6b80822cd142b7de1903ccfR444
    i3lock.enable = true;
    i3lock-color.enable = true;
    xlock.enable = true;
    xscreensaver.enable = true;
  };

}