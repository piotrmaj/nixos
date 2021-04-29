{
  description = "piotrmaj's nixos setup powered by flake";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-20.09";
    nixpkgs. url = "github:nixos/nixpkgs/nixos-20.09";
  };

  outputs = {self, home-manager, nixpkgs, ... }: 
    let
      system = "x86_64-linux";
      settings = import ./settings.nix;
    in
    {
      nixosConfigurations.nixvm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
            ./machines/nixvm.nix
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${settings.user.username} = import ./home.nix;
            }
        ];
      };
    };
}
