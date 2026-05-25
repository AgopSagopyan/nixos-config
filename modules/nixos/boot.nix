{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  boot = {

    kernel = {
      sysctl = {
        "fs.inotify.max_user_watches" = 524288;
      };
    };

    supportedFilesystems = [
      "fuse"
      "ntfs"
    ];
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
    ];

    loader = {
      systemd-boot = {
        enable = false;

        configurationLimit = 5;
      };

      timeout = -1;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        efiInstallAsRemovable = true;
        useOSProber = true;
        theme = pkgs.sleek-grub-theme.override {
          withStyle = "bigSur";
        };
      };
      efi = {
        canTouchEfiVariables = false;
      };
    };
  };

}
