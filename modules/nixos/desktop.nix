{ config, pkgs, ... }:
{
  services.desktopManager = {
    gnome.enable = true;

    plasma6.enable = true;
  };

  services.xserver.desktopManager = {
    xfce.enable = false;
  };

  services.xserver.windowManager = {
    i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3blocks
      ];
    };
  };

}
