{ pkgs, inputs, ... }:
{
  environment.systemPackages =
    (with pkgs; [
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
    ])
    ++ ([
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ]);
}
