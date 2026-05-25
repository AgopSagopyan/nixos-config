{
  inputs,
  pkgs,
  ...
}:

{

  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./waybar.nix
    ./neovim.nix
    ./theme.nix
    ./alacritty.nix
    ./eww.nix
  ];

  services.flatpak = {
    enable = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "com.usebottles.bottles"
      "tr.org.pardus.pen"
      "jp.nonbili.noutube"
      "app.zen_browser.zen"
      # "io.github.shiftey.Desktop"
    ];
  };

  home.stateVersion = "24.11";

  home.sessionVariables = {
    #XCURSOR_THEME = "Adwaita";
    #XCURSOR_SIZE = "24";
    #XCURSOR_PATH = "/run/current-system/sw/share/icons";
  };
  /*
    programs.firefox = {
      enable = true;
      profiles.keremcem = {
        isDefault = true;
        settings = {
          "browser.search.region" = "US";

          "extensions.autoDisableScopes" = 0;
          "extensions.enabledScopes" = 15;
        };
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          darkreader
          youtube-shorts-block

        ];
      };
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
      };
    };
  */

  /*
    programs.lazygit = {
      enable = true;
      settings = {
        gui.theme = {
          lightTheme = false;
        };
      };
    };
  */

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "AgopSagopyan";
        email = "keremcemerturk@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };

  # xdg.configFile."nvim" = {
  #  source = ./config/nvim;
  # };

  # home.pointerCursor = {
  # gtk.enable = true;

  # package = pkgs.bibata-cursors;
  # name = "Bibata-Modern-Classic";
  # size = 24;

  # };

  /*
    gtk = {
      enable = true;
      theme = {
        package = pkgs.gruvbox-gtk-theme;
        name = "Gruvbox-Dark";
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

    };
  */
  /*
    qt = {
      enable = true;

      platformTheme.name = "qtct";

      style.name = "kvantum";

      # package = pkgs.gruvbox-kvantum;
    };

    xdg.configFile."gtk-3.0/settings.ini".force = true;

    xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Gruvbox-Kvantum
    '';
  */

  home.packages = with pkgs; [
    gruvbox-kvantum
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    alacritty-theme
    gnomeExtensions.desktop-icons-ng-ding
    gnomeExtensions.dash-to-panel
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tiling-shell
    gnomeExtensions.burn-my-windows
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nvf = "nix run /home/keremcem/KEREM/Projects/neovimFlakeNVF/";

      rebuildswitch = "sudo nixos-rebuild switch --flake /home/keremcem/Flakes/#keremcem";

      homedebug = "nix run github:nix-community/home-manager -- switch --flake /home/keremcem/Flakes/.#keremcem";

      ls = "lsd";
    };
  };

  programs.vscode = {
    enable = false;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
    ];

  };

  programs.waybar = {
    enable = true;

    settings = {

    };
  };

}
