{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.kitty = {
    enable = true;
    theme = "Snazzy";
    font = {
      name = "FiraCode Nerd Font";
    };
    extraConfig = "hide_window_decorations yes";
  };
}
