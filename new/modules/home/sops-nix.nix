{ inputs, settings, ... }:

{
  # based on https://github.com/fschn90/nixos/blob/main/modules/sops.nix
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {

    defaultSopsFile = ../../secrets/main.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/var/lib/sops-nix/key.txt";

    age.sshKeyPaths = [ "/etc/ssh/id_rsa" ];
    age.generateKey = true;

    secrets."ssh/keys/id_rsa" = {
      mode = "0600";
      path = "/home/${settings.user.username}/.ssh/id_rsa";
    };
  };
}  