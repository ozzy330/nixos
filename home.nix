{ config, pkgs, ... }:

{
  home.username = "ozzy330";
  home.homeDirectory = "/home/ozzy330";
  home.stateVersion = "23.11";

  imports = [ 
      ./config
    ];

  home.packages = with pkgs; [
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    direnv
    lazygit
    nasm
    llvmPackages_17.clang-unwrapped
    llvmPackages_17.libcxxClang
    ventoy-full
    smartmontools
    figlet
    testdisk
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.gh.enable = true;

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "ozzy330";
    userEmail = "oskar.quesada30@gmail.com";
    extraConfig = {
      credential.helper = "oauth";
    };
  };
}
