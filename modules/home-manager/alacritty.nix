{
  programs.alacritty = {

    enable = true;

    # theme = "rose_pine";
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

  /*
    xdg.configFile."alacritty/alacritty.toml".text = ''
        [font]
        size = 10.0

        theme = catpuccin

        [font.normal]
        family = "BlexMono Nerd Font"
        style = "Regular"

        [font.bold]
        family = "BlexMono Nerd Font"
        style = "Bold"

        [font.italic]
        family = "BlexMono Nerd Font"
        style = "Italic"

        [colors.primary]
        background = "#1A1B26"
        foreground = "#00FF41"

        [colors.normal]
        black = "#000000"
        red = "#FF0000"
        green = "#00FF41"
        yellow = "#DFFF00"
        blue = "#0000FF"
        magenta = "#FF00FF"
        cyan = "#00FFFF"
        white = "#EEEEEE"

        [colors.bright]
        black = "#444444"
        red = "#FF4444"
        green = "#55FF55"
        yellow = "#FFFF00"
        blue = "#4444FF"
        magenta = "#FF44FF"
        cyan = "#44FFFF"
        white = "#FFFFFF"
      '';
  */
}
