{
  pkgs,
  ...
}:
{
  programs.xwayland.enable = true;
  programs.firefox = {
    enable = true;
    preferences = {
      "privacy.resistFingerprinting" = true;
    };
    policies = {
      DisableTelemetry = true;
    };
  };
  programs.niri.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
  programs.adb.enable = true;
  programs.localsend.enable = true;
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
}
