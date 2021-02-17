{ pkgs, ... }:


{
  programs = {
    vscode = {
      enable = true;
      userSettings = {
        telemetry.enableTelemetry = false;
      };
      extensions = with pkgs.vscode-extensions; [
        ms-vscode-remote.remote-ssh
      ] ++pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "remote-containers";
          publisher = "ms-vscode-remote";
          version = "0.158.0";
          sha256 = "07aqhh2pv8b9sj5icixhm921iwxyxcph0f0g5zm9mp45arxy3844";
        }
        {
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        }
      ];
    };
  };
}
