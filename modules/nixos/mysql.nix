{
  config,
  pkgs,
  lib,
  inputs,
  ...

}:
{
  services.mysql = {
    enable = true;
    package = pkgs.mysql84;

    ensureUsers = [
      {
        name = "keremcem";
        ensurePermissions = {
          "*.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    php84Packages.composer
    tailwindcss
  ];
}
