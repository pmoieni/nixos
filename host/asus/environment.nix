{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      # battery charge limit script
      # chargeUpto
      brave
      shotwell
      evince
      alacritty
      wev
      thunar
      file-roller
      ffmpeg-full
      mpv
      wl-clipboard
      pavucontrol
      xwayland-satellite
      playerctl
      gpu-screen-recorder
      gdu
      android-tools
      dnsmasq # required by libvirtd
    ];
}
