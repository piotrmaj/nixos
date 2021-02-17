{ config, lib, pkgs, ... }:

let
  settings = import ../../settings.nix;

in {
  imports = [
    ./basic/git.nix
    ./basic/zsh.nix
    ./basic/tmux.nix
  ];

  home.packages = with pkgs; [
  ];

  programs = {
    # cat replacement.
    bat = {
      enable = true;
      /*config = {
        theme = "nord";
      };
      themes = {
        nord = (builtins.readFile ../themes/base_16_nord.tmTheme);
      };*/
    };

    # environment autoloading.
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableNixDirenvIntegration = true;
    };

    # fuzzy finding.
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "${lib.getBin pkgs.fd}/bin/fd --type f";
      defaultOptions = [
        "--reverse"
        "--height 40%"
      ];
    };

    

    # process viewing.
    htop = {
      enable = true;
      fields = [
         "PID" "USER" "M_SIZE" "M_RESIDENT" "PERCENT_CPU" "PERCENT_MEM" "TIME" "COMM"
      ];
      showProgramPath = false;
    };

    # file managing.
    lf = {
      enable = true;
    };

    # ssh agent
    ssh = {
      enable = true;
      compression = true;
      matchBlocks = {
            "*".identityFile = "~/.ssh/id_maju";
      };
    };
  };
}