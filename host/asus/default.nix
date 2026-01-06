{
  imports = [
    ./environment.nix
    ./hardware.nix
    ./networking.nix
    ./programs.nix
    ./qt.nix
    ./security.nix
    ./services.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
    ./xdg.nix
  ];

  system.stateVersion = "25.05";
}
