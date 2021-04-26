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
          name = "Nix";
          publisher = "bbenoist";
          version = "1.0.1";
          sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
        }
        {
          name = "remote-containers";
          publisher = "ms-vscode-remote";
          version = "0.166.0";
          sha256 = "1jv3zjwa1sdylkgrmq9cjq48s4pf1gs6lwb3iigxb66q408xibl6";
        }
      ];
    };
  };
}
