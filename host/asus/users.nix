{
  pkgs,
  inputs,
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
      "libvirtd"
    ];
    packages =
      (with pkgs; [
        audacity
        telegram-desktop
        blender
        obs-studio
        zed-editor
        anydesk
        krita
        v2rayn
        ventoy-full
      ])
      ++ ([
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ]);
  };
}
