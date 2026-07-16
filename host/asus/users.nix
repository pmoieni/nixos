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
        telegram-desktop
        zed-editor
        jetbrains.idea
        jdk25
        v2rayn
      ])
      ++ ([
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      ]);
  };
}
