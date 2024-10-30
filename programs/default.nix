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

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Extra
    bear
    gcc
    binutils
    libgcc
    tree-sitter
    # Language Servers
    ltex-ls
    nodePackages_latest.intelephense
    typst-lsp
    nodePackages_latest.bash-language-server
    nginx-language-server
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
    ast-grep
    gopls
    phpactor
    typescript
    eslint_d
    yaml-language-server
    gdtoolkit_4
    omnisharp-roslyn
    clang-tools
    # Formatters
    asmfmt
    prettierd
    nixfmt-rfc-style
    nasmfmt
    nginx-config-formatter
    yamllint
    typstyle
    nodePackages_latest.prettier
    csharpier
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
      omnisharp-extended-lsp-nvim
    ];
  };
}
