{
  networking = {

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [ 8000 ];
      allowedUDPPorts = [ ];
    };

    hostName = "tulpar";

    wireless.enable = true;
  };
}
