{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";

    gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      # elisa # Music player
      # gwenview # Image viewer
      # okular # Document viewer
      kate # Text editor
      khelpcenter # Help documentation
      # konsole # Terminal (Remove only if you use a different one)
      # plasma-browser-integration
      # print-manager
    ];

    systemPackages = with pkgs; [

      # Nix Tools
      nixd
      nixfmt

      # Coding
      jetbrains.rider
      dotnet-sdk_8
      netcoredbg
      #unityhub
      wl-clipboard
      lftp
      php
      lua-language-server
      intelephense
      wget
      cloudflared
      git
      git-lfs
      # vscode
      python314Packages.ds4drv
      php85Packages.php-cs-fixer
      dotnet-sdk_9
      # vscode-fhs
      antigravity
      neovim
      gcc
      devenv

      (pkgs.vscode-fhsWithPackages (
        ps: with ps; [
          dotnet-sdk_8 # Or dotnet-sdk_9 depending on what you use
        ]
      ))

      # Android
      android-tools
      android-file-transfer
      scrcpy

      # Internet Browser
      brave
      librewolf

      # Terminals
      # kitty
      alacritty

      # Media
      qview
      pavucontrol
      musikcube
      vlc

      # Game Launchers
      heroic

      # Emulators
      #rpcs3
      # xemu

      # Wine/Proton
      protonup-qt
      protontricks
      mono

      # CLI Tools
      lsd
      ripgrep
      tree
      powertop
      fastfetch

      # Bluetooth
      # blueberry

      # Polkit
      lxqt.lxqt-policykit
      polkit_gnome

      # Disk Utilities
      simple-mtpfs
      efibootmgr
      os-prober

      # Graphics Tools
      mesa-demos

      #Themes
      kdePackages.breeze-icons
      nwg-look
      bibata-cursors
      xcursor-themes
      hyprcursor
      adwaita-icon-theme

      #Documents
      thunderbird
      libreoffice

      # File Explorer
      pcmanfm
      nautilus
      ranger

      #Modeling
      blender
      inkscape
      gimp

      # Zip/Rar
      unzip
      cpio
      unrar

      # Containerization
      distrobox

      #Desktop
      xwayland-satellite
      # crystal-dock
      walker
      gnome-control-center
      gnome-tweaks
      hyprpolkitagent
      brightnessctl
      niri
      wofi
      waybar
      hyprpaper
      swaybg
      yaru-theme
      nitrogen
      gnome-system-monitor
      eww
      sticky

      zapret

      # Neovim
      vimPlugins.nvim-unity

      kdePackages.qtstyleplugin-kvantum

      (pkgs.writeShellScriptBin "prime-run" ''
            export __NV_PRIME_RENDER_OFFLOAD=1
        	export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-GO
        	export __GLX_VENDOR_LIBRARY_NAME=nvidia
        	export __VK_LAYER_NV_optimus=NVIDIA_only
        	exec "$@"
      '')
    ];
  };
}
