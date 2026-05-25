{
 virtualisation = {
    virtualbox.host.enable = true;

    podman = {
        enable = true;
        dockerCompat = true;
    };

    docker = {
      enable = false;
      

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
