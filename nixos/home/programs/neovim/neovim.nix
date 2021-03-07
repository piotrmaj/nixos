{ pkgs, ... }:

let customVimPlugins = {
  omnisharp-vim = pkgs.vimUtils.buildVimPlugin {
    name= "omnisharp-vim";
    src = pkgs.fetchFromGitHub {
      owner = "OmniSharp";
      repo = "omnisharp-vim";
      rev = "87f409374a2e36bf4afbbf627519dfca899d7df9";
      sha256 = "0panry101bhgr6dap98yhf3h43y3hqiplc5q8fa2m3n82r90s4fw";
    };
  };
  vim-nerdtree-sync = pkgs.vimUtils.buildVimPlugin {
    name= "vim-nerdtree-sync";
    src = pkgs.fetchFromGitHub {
      owner = "unkiwii";
      repo = "vim-nerdtree-sync";
      rev = "f0ec649ac2045f6bf9e32efffbdc3e7aaee419d2";
      sha256 = "14k8yb7z4chs7ql60cj3zqbprdr1fn7phkzbj1lnqzp5dh3j2rnz";
    };
  };
};

in {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins // customVimPlugins ; [
        fzf-vim
        fzfWrapper
        ack-vim
        gruvbox
        nerdtree
        vim-nix
        vim-nerdtree-sync
      ];

      extraConfig = builtins.readFile ./.vimrc;
    };
}
