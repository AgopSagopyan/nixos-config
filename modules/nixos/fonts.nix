{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    fira-code
    fira-code-symbols
    dina-font
    proggyfonts

    nerd-fonts.hurmit
    nerd-fonts._3270
    nerd-fonts.hack
    nerd-fonts.blex-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "BlexMono Nerd Font" ];
      sansSerif = [ "BlexMono Nerd Font" ];

      monospace = [ "JetBrains Mono" ];
    };
  };
}
