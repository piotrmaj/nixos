
{ lib, pkgs, ... }:

let
  settings = import ../settings.nix;

in {
  imports = [
    ./gnome.nix
    # ./i3.nix
  ];
}
