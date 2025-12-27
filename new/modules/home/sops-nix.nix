{ inputs, ... }:
{
  inputs.sops-nix.url = "github:Mic92/sops-nix";
  inputs.sops-nix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, host, sops-nix }: {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      modules = [
        sops-nix.nixosModules.sops
      ];
    };
  };
}