{ config, pkgs, lib, ... }:
{
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
      rose-pine
      nvim-treesitter.withAllGrammars
      vim-fugitive
      vim-rhubarb
      vim-sleuth
      nvim-lspconfig
      neodev-nvim
      nvim-cmp
      cmp-path
      cmp-nvim-lsp
      cmp-buffer
      luasnip
      cmp_luasnip
      gitsigns-nvim
      comment-nvim
      telescope-nvim
      telescope-file-browser-nvim
      telescope-fzf-native-nvim
      plenary-nvim
      toggleterm-nvim
      vim-suda
      lualine-nvim
      nvim-web-devicons
      toggleterm-nvim
      neogen
      oil-nvim
      nvim-colorizer-lua
      todo-comments-nvim
      trouble-nvim
      nabla-nvim
      vim-table-mode
      vim-markdown
    ];
    # extraLuaConfig =  '' 
    #
    #   ${builtins.readFile ( ./. + "/nvim/init.lua")}
    #   ${builtins.readFile ( ./. + "/nvim/plugins/lualine.lua")}
    #
    # '';
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
}
