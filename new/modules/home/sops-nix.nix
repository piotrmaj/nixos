{ inputs, ... }:
{
  # Configuration via home.nix
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
}