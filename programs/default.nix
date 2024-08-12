{ pkgs, ... }:
{
  imports = [ ./kitty.nix ];

  # firefox
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      settings = {
        "browser.startup.homepage" = "https://duckduckgo.com/";
        "dom.security.https_only_mode" = true;
        "privacy.donottrackheader.enabled" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      search.default = "DuckDuckGo";
      userChrome = builtins.readFile ./firefox/userChrome.css;
    };
  };

  # neovim
  home.file.nvim = {
    source = ./neovim;
    target = "./.config/nvim/";
    recursive = true;
  };

  home.packages = with pkgs; [
    # Language Servers
    lua-language-server
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.tailwindcss
    tailwindcss-language-server
    marksman
    phpactor
    nil
    stylua
    asm-lsp
    asmfmt
    ast-grep
    gopls
    phpactor
    typescript
    eslint_d
    prettierd
    nixfmt-rfc-style
    nasmfmt
    # Plugins
  ];

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      markdown-preview-nvim
      nvim-treesitter-parsers.nasm
    ];
  };
}
