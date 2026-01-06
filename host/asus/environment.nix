{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # battery charge limit script
    # chargeUpto
    wev
    file-roller
    kdePackages.dolphin
    gparted
    ffmpeg-full
    mpv
    wl-clipboard
    wl-clip-persist
    wl-color-picker
    pavucontrol
    xwayland-satellite
    playerctl
    nur.repos.ataraxiasjel.waydroid-script
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];
}
