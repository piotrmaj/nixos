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
};

in {
    programs.vim = {
        enable = true;
        settings = {
            number = true;
            expandtab = true;
          };
        plugins = with pkgs.vimPlugins // customVimPlugins; [
          nerdtree
          omnisharp-vim
        ];

    };
}
