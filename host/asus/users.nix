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
      alacritty
      obsidian
      audacity
      telegram-desktop
      blender
      brave
      obs-studio
      zed-editor
      shotwell
      anydesk
      vesktop
      evince
    ];
  };
}
