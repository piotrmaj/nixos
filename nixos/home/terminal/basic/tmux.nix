{ ... }:

{
 programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    baseIndex = 1;
    keyMode = "vi";
  };
}