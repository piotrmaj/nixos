{ pkgs, lib, ...}:
{
  # Let Home Manager install and manage itself
  programs.home-manger.enable = true;

  imports = [
    ./home/terminal/basic.nix
    ./home/desktop/basic.nix
    ./home/desktop/keys.nix
    ./home/programs/default.nix
  ];
}