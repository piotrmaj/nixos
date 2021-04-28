{
  description = "A very basic flake";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs. url = "github:nixos/nixpkgs/nixos-20.09";
  };

  outputs = {self, home-manager, nixpkgs, ... }: {

    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    # defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

    nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [ 
          ./machines/nixvm.nix
          home-manager.nixosModules.home-manager
          ./configuration.nix
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   #home-manager.users.jdoe = import ./home.nix;
          #   home-manager.users.maju = {

          #     programs.home-manager.enable = true;
          #     home.username = "maju";
          #     home.homeDirectory = "/home/maju";
          #     /*nixpkgs = {
          #       overlays = [
          #         (import ./pkgs/default.nix)
          #       ];
          #       config.allowUnfree = true;

          #       # Allow certain unfree programs to be installed.
          #       config = {
          #         allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
          #         # "discord"
          #         # "faac"
          #         # "postman"
          #         # "slack"
          #           "spotify"
          #         # "steam"
          #         # "steam-original"
          #         # "steam-runtime"
          #         # "zoom-us"
          #         ];
          #       };
          #     };*/

          #     # imports = [
          #     #   ./home/terminal/basic.nix
          #     #   ./home/desktop/basic.nix
          #     #   ./home/desktop/keys.nix
          #     #   ./home/programs/default.nix
          #     # ];
          #   };
          # } 
      ];
    };
  };
}
