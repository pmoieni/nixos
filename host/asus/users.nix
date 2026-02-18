{
  pkgs,
  ...
}:
{
  users.users.pmoieni = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "lp"
      "scanner"
      "wireshark"
      "podman"
    ];
    packages = with pkgs; [
      obsidian
      audacity
      telegram-desktop
      blender
      obs-studio
      zed-editor
      jetbrains.idea
      jdk # for intellij
      anydesk
      vesktop
      v2rayn
      protonvpn-gui
      sirikali
      gocryptfs
      pcsx2
    ];
  };
}
