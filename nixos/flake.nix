{
  description = "piotrmaj's nixos setup powered by flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
