{ pkgs, ... }:
let
  package = pkgs.vscode-with-extensions.override {
    vscodeExtensions = (with pkgs.vscode-extensions; [
      bbenoist.Nix
      ms-vscode-remote.remote-ssh
    ]) ++pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-containers";
        publisher = "ms-vscode-remote";
        version = "0.166.0";
        sha256 = "1jv3zjwa1sdylkgrmq9cjq48s4pf1gs6lwb3iigxb66q408xibl6";
      }
    ];
  };
  my-vscode-package = package // { pname = pkgs.vscode.pname; };
in
{
  programs = {
    vscode = {
      enable = true;
      userSettings = {
        telemetry.enableTelemetry = false;
      };
      package = my-vscode-package;
    };
  };
}
