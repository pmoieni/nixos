{
  networking.hostName = "nixos";
  networking.wireless.iwd = {
    enable = false;
    settings = {
      Settings = {
        AutoConnect = true;
      };
    };
  };
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
}
