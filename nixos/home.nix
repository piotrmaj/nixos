{ pkgs, lib, ...}:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = false;

  imports = [
    ./home/terminal/basic.nix
    ./home/desktop/basic.nix
    ./home/desktop/keys.nix
    ./home/programs/default.nix
  ];
}