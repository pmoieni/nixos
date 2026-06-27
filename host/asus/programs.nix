{
  pkgs,
  ...
}:
{
  programs.xwayland.enable = true;
  programs.niri.enable = true;
  programs.dms-shell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    # enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    # enableCalendarEvents = true;
    enableClipboardPaste = true;
  };
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
  programs.amnezia-vpn.enable = true;
  programs.localsend.enable = true;
  programs.kdeconnect.enable = true;
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.virt-manager.enable = true;
}
