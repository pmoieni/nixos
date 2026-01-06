{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager.url = "github:pmoieni/home-manager";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixos-wsl,
      home-manager,
      treefmt-nix,
      stylix,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      treefmtEval = forAllSystems (
        system:
        treefmt-nix.lib.evalModule nixpkgs.legacyPackages.${system} {
          projectRootFile = "flake.nix";
          programs = {
            nixfmt.enable = true; # Format Nix files
            prettier.enable = true; # Format JSON, YAML, Markdown
            shellcheck.enable = true; # Lint shell scripts
            shfmt.enable = true; # Format shell scripts
          };
          settings.formatter = {
            prettier.excludes = [ "*.lock" ];
          };
        }
      );
    in
    {
      # Formatter for `nix fmt`
      formatter = forAllSystems (system: treefmtEval.${system}.config.build.wrapper);

      # Checks for `nix flake check`
      checks = forAllSystems (system: {
        formatting = treefmtEval.${system}.config.build.check self;
      });

      nixosConfigurations = {
        asus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host
            ./host/asus
            stylix.nixosModules.stylix
            home-manager.inputs.home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                isNixOS = true;
              };
            }
            home-manager.nixosModules.default
            {
              system.gui.enable = true;
            }
          ];
        };

        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./host
            ./host/wsl
            nixos-wsl.nixosModules.default
            home-manager.inputs.home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                isNixOS = true;
              };
            }
            home-manager.nixosModules.default
            {
              system.gui.enable = true;
            }
          ];
        };
      };

      devShells = forAllSystems (system: {
        default = import ./shell.nix {
          pkgs = import nixpkgs {
            inherit system;
          };
        };
      });
    };
}
