{ pkgs, ... }:
{
  services.fstrim.enable = true;

  services.upower.enable = true;

  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;

  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us,ir";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle,caps:swapescape";
    videoDrivers = [
      "modesetting"
      "nvidia"
    ];
  };

  services.fwupd.enable = true;
  services.blueman.enable = true;

  services.displayManager.ly.enable = true;

  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  # tlp and auto-cpufreq shouldn't be enabled simultaneously
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 80;
      START_CHARGE_THRESH_BAT1 = 0;
      STOP_CHARGE_THRESH_BAT1 = 80;
    };
  };
  services.auto-cpufreq = {
    enable = false;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };

  services.cloudflare-warp.enable = true;
  services.v2raya.enable = true;
}
