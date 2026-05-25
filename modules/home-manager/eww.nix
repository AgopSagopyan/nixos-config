{
  xdg.configFile."eww/eww.yuck".text = ''
    (include "/home/keremcem/Flakes/modules/config/eww/default.yuck")
  '';

  xdg.configFile."eww/eww.scss".text = ''
    @import "../config/eww/default.scss"
  '';

}
