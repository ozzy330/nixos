# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "America/Costa_Rica";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # For intel GPUs
  hardware.graphics = {
    # hardware.opengl in 24.05
    enable = true;
    enable32Bit = true; # driSupport32Bit in 24.05
    extraPackages = with pkgs; [ intel-compute-runtime ];
  };

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ozzy330 = {
    isNormalUser = true;
    description = "ozzy330";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  services.fprintd.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    htop
    wget
    neovim
    kitty
    gh
    git
    git-lfs
    nix-search-cli
    virt-viewer
    busybox
    go
    python3
    libgccjit
    binutils
    axel
    jellyfin-ffmpeg
    xclip
    glow
    gnome.gnome-tweaks
    cloudflared
    cloudflare-warp
    podman
    qemu
    gnome.gnome-boxes
    moonlight-qt
    motrix
    telegram-desktop
    stremio
    home-manager
    podman
    typora
    postman
    ciscoPacketTracer8
    davinci-resolve
    vdhcoapp
    clipgrab

  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  environment.variables.EDITOR = "nvim";
  # programs.neovim.enable = true;
  # programs.neovim.defaultEditor = true;

  programs.fish.enable = true;
  programs.starship.enable = true;
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    shellInit = ''
      function upnix
        pushd ~/.config/nixos/
          git push
        popd
      end
      function cmmnix
        pushd ~/.config/nixos/
        git add configuration.nix
        git commit -m $argv[1]
        popd
      end
      function chnix
        nvim /etc/nixos/configuration.nix
      end
      function swnix
        cmmnix $argv[1]
        set argv[1] ""
        sudo nixos-rebuild switch
      end
    '';
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.podman.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    uclibc
    liboil
    glib
    nss
    nspr
    dbus
    atk
    cups
    libdrm
    gtk3
    gdk-pixbuf
    glib
    nss
    nspr
    dbus
    atk
    cups
    libdrm
    pango
    cairo
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libxcb
    mesa
    expat
    libxkbcommon
    alsaLib
    openssl
    iconv
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
