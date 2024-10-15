{ config, pkgs, ... }:

with pkgs;
let
  R-with-my-packages = rWrapper.override {
    packages = with rPackages; [
      ggplot2
      dplyr
      xts
      pacman
      rio
      tidyverse
      arrow
      hexView
      fst
      pzfx
      rmatio
      readODS
      qs
      conflicted
      gridExtra
      tidyr
      reshape2
      RColorBrewer
      ggrepel
    ];
  };
in

{
  home.username = "ozzy330";
  home.homeDirectory = "/home/ozzy330";
  home.stateVersion = "23.11";

  imports = [ ./programs ];

  home.packages = with pkgs; [
    openvpn3
    font-awesome
    times-newer-roman
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
    vesktop
    gnumake
    nodejs_22
    yarn
    tftp-hpa
    mariadb_110
    godot_4
    blender
    f3d
    gnome.sushi
    pandoc
    typst
    R-with-my-packages
    git-credential-oauth
    viu
    youtube-music
    xorg.xhost
    krita
    wireshark
    p7zip
    dotnet-sdk_8
    sqlcmd
    docker_27
    vlc
  ];

  home.file = { };

  home.sessionVariables = { };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "ozzy330";
    userEmail = "oskar.quesada30@gmail.com";
    extraConfig = {
      credential.helper = "cache";
      push.autoSetupRemote = true;
    };
    lfs.enable = true;
  };

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };
}
