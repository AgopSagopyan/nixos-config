{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./mysql.nix
    ./desktop.nix
    ./firefox.nix
    ./boot.nix
    ./hardware.nix
    ./environment.nix
    ./users.nix
    ./fonts.nix
    ./networking.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "25.11";

  nix.gc = {
    automatic = true;
    dates = "monthly";
    options = "--delete-older-than 31d";

  };

  services = {

    zapret = {
      enable = true;
      configureFirewall = true;

      httpSupport = true;

      udpSupport = true;
      udpPorts = [
        "443"
        "50000:65535"
      ];

      whitelist = [
        "discord.com"
        "discord.gg"
        "discord.media"
        "discordapp.com"
        "discordapp.net"
        "discordcdn.com"
        "media.discordapp.net"
        "cdn.discordapp.com"
      ];

      # Turkey DPI Settings
      params = [
        "--filter-tcp=80 --dpi-desync=fake,multisplit --dpi-desync-split-pos=method+2 --dpi-desync-fooling=md5sig"
        "--filter-tcp=443 --dpi-desync=fake,split --dpi-desync-ttl=4 --dpi-desync-fooling=badsum"
        "--filter-udp=443 --dpi-desync=fake --dpi-desync-ttl=4 --dpi-desync-fooling=badsum"
      ];

    };

    logind.settings = {
      Login = {
        IdleAction = "ignore";
      };
    };

    vsftpd = {
      enable = false;
    };

    # blueman.enable = true;

    openssh.enable = true;

    flatpak.enable = true;
    dbus.enable = true;
    gnome.gnome-keyring.enable = true;
    gnome.core-apps.enable = false;
    printing.enable = false;

    gvfs.enable = true;

    displayManager = {
      sddm.wayland.enable = false;
      sddm.enable = false;
      gdm.enable = false;
      ly.enable = false;

      plasma-login-manager.enable = true;

    };

    pulseaudio.enable = false;

    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
      jack.enable = true;
    };

    libinput.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager = {
      };

      xkb = {
        layout = "tr";
        variant = "";
      };
    };
  };

  programs.hyprland.xwayland.enable = true;
  programs.xwayland.enable = true;

  system.nixos.label = "NIXOS";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "keremcem"
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  time.timeZone = "Europe/Istanbul";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  console.keyMap = "trq";

  xdg.mime.defaultApplications = {
    "image/png" = [ "com.inerversehq.qView.desktop" ];
    "video/mp4" = [ "vlc.desktop" ];
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "alacritty.desktop" ];

      GNOME = [ "alacritty.desktop" ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  # If you want to use JACK applications, uncomment this
  #jack.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # Install firefox.

  programs.steam.enable = true;

  programs.hyprland.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
