{ pkgs, ...}:
{
  # Let Home Manager install and manage itself
  #programs.home-manger-enable = true;
  # home-manager.useGlobalPkgs = true;

  # home-manager.users.${settings.user.username} =  {
  #programs.home-manger.enable = true;
#   nixpkgs = {
#         overlays = [
#         (import ./pkgs/default.nix)
#         ];
#         config.allowUnfree = true;

#         # Allow certain unfree programs to be installed.
#         config = {
#         allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
#             # "discord"
#             # "faac"
#             # "postman"
#             # "slack"
#             "spotify"
#             # "steam"
#             # "steam-original"
#             # "steam-runtime"
#             # "zoom-us"
#         ];
#         };
#     };

  imports = [
    ./home/terminal/basic.nix
    # ./home/desktop/basic.nix
    # ./home/desktop/keys.nix
    #./home/programs/default.nix
  ];
}