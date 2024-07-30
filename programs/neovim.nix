{ config, pkgs, lib, ... }:
{
  home.file.nvim = {
    source = ../nvim;
    target = "./.config/nvim/";
    recursive = true;
  };

  home.packages = with pkgs; [
    lua-language-server
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.tailwindcss
    tailwindcss-language-server
    marksman
    phpactor
    asm-lsp
    nil
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
			];
  };
}
