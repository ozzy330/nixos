{ config, pkgs, ... }:

{
  home.username = "ozzy330";
  home.homeDirectory = "/home/ozzy330";
  home.stateVersion = "23.11";

  imports = [ ./programs ];

  home.packages = with pkgs; [
    fd
    ripgrep
    fira-code
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    direnv
    lazygit
    ventoy-full
    smartmontools
    figlet
    testdisk
    podman-compose
    gnumake
    nodejs_22
    yarn
    tftp-hpa
  ];

  home.file = { };

  home.sessionVariables = { };

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

  programs.direnv = {
    enable = true;
    enableFishIntegration = true; # Habilitar integración con fish
  };
}
