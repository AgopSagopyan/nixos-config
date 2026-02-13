{ config, pkgs, lib, nix-flatpak, ... }:

{

  imports = [
    nix-flatpak.homeManagerModules.nix-flatpak
    ./waybar.nix
  ];

  services.flatpak = {
    enable = true;

    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    packages = [
      "com.usebottles.bottles"
      "tr.org.pardus.pen"
      "jp.nonbili.noutube"
      "io.github.shiftey.Desktop"
    ];
  };


  home.stateVersion = "24.11";

  home.sessionVariables = {
  XCURSOR_THEME = "Adwaita";
  XCURSOR_SIZE = "24";
  XCURSOR_PATH = "/run/current-system/sw/share/icons";
};

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



  programs.neovim = {
    enable = true;
    defaultEditor = true;
    
    plugins = with pkgs; with vimPlugins; [
      gruvbox-nvim
      barbar-nvim
      nvim-lspconfig
      mason-lspconfig-nvim

      telescope-nvim
      lualine-nvim
      nvim-notify
      
      nvim-treesitter
      nvim-web-devicons

    ];
  };
  

  xdg.configFile."nvim" = {
    source = ./config/nvim;
  };

  home.pointerCursor = {
    gtk.enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;


  };
  
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };

  };

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

  home.packages = with pkgs; [
    gruvbox-kvantum
    libsForQt5.qtstyleplugin-kvantum 
    kdePackages.qtstyleplugin-kvantum

    alacritty-theme
  ];

  programs.alacritty = {
    enable = true;

    theme = "gruvbox_dark";

    settings = {
      font = {
        size = 12.0;
        normal = {
          family = "BlexMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "BlexMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "BlexMono Nerd Font";
          style = "Italic";
        };
      };
    };
    
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuildswitch = "sudo nixos-rebuild switch --flake /home/keremcem/Flakes/#keremcem";  
    };
  };

  programs.vscode = {
    enable = true;
    
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
