{ config, lib, pkgs, ... }:

let
  settings = import ../../settings.nix;

in {
  imports = [
    ./basic/git.nix
  ];

  home.packages = with pkgs; [
  ];

  programs = {
    # cat replacement.
    bat = {
      enable = true;
      config = {
        theme = "nord";
      };
      themes = {
        nord = (builtins.readFile ../themes/base_16_nord.tmTheme);
      };
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

    # bash replacement.
    zsh = {
      enable = true;

      prezto = {
        enable = true;

        pmodules = [
          "archive"
          "directory"
          "completion"
          "editor"
          "environment"
          "history"
        ];
      };

      sessionVariables = {
        EDITOR = "vim";
      };
    };
  };
}