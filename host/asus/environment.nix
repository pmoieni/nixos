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
      xfce.thunar
      file-roller
      gparted
      ffmpeg-full
      mpv
      wl-clipboard
      wl-clip-persist
      wl-color-picker
      pavucontrol
      xwayland-satellite
      playerctl
      gpu-screen-recorder
      gdu
      amnezia-vpn
    ];
}
