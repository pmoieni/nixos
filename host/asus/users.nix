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
      anydesk
      vesktop
      v2rayn
      protonvpn-gui
      dbeaver-bin
    ];
  };
}
