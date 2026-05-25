{
  users = {
    extraGroups.vboxusers.members = [ "keremcem" ];
    users.keremcem = {
      isNormalUser = true;
      description = "keremcem";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "adbusers"
      ];
    };
  };
}
