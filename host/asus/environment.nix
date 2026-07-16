{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      # battery charge limit script
      # chargeUpto
      brave
      shotwell
      evince
      alacritty
      thunar
      file-roller
      mpv
      wl-clipboard
      pavucontrol
      xwayland-satellite
      playerctl
      gdu
      android-tools
      dnsmasq # required by libvirtd
    ];
}
