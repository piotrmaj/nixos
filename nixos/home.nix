{ pkgs, lib, ...}:
{
  # Let Home Manager install and manage itself
  programs.home-manger-enable = true;

  home.packages = with pkgs; [
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

  imports = [
    ./home/terminal/basic.nix
    ./home/desktop/basic.nix
    ./home/desktop/keys.nix
    ./home/programs/default.nix
  ];
}