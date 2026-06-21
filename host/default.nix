{ pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes pipe-operators";
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables = {
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    GSK_RENDERER = "ngl";
    GDK_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
    vim
    podman-compose
    wget
    tree
    htop
    curlFull
    zip
    unzip
    coreutils-full
    pciutils
    net-tools
    wirelesstools
    fd
    jq
    fzf
    openssl
    lshw
    usbutils
    psmisc
  ];

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.blex-mono
      nerd-fonts.recursive-mono
      nerd-fonts.caskaydia-cove
      material-symbols
    ];
  };
}
