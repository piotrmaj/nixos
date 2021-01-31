{ config, lib, pkgs, ... }:


{
    home.packages = with pkgs; [
        pkgs.zsh-powerlevel10k
    ];
    # bash replacement.
    programs.zsh = {
        enable = true;
        autocd = true;
        enableCompletion = true;
        enableAutosuggestions = true;

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

        oh-my-zsh = {
            enable = true;
            # theme = "powerlevel10k";
            # plugins = [ "git" "sudo" "docker" ];
            /*extraConfig = ''
                source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/config/p10k-lean.zsh
            '';
            extraConfig = ''
                source ${pkgs.jump}/share/zsh/site-functions/_jump
                source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
                source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
                ${builtins.readFile ./config/p10k.zsh}
            '';*/
        };

        plugins = [
            {
                name = "powerlevel10k";
                src = pkgs.zsh-powerlevel10k;
                file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
            }
            {
                name = "powerlevel10k-config";
                src = lib.cleanSource ./config;
                file = "p10k.zsh";
            }
        ];
        sessionVariables = {
          EDITOR = "vim";
          TERMINAL = [ "alacritty" ];
        };
    };
}
