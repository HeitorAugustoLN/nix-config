{
  config,
  inputs,
  lib,
  withSystem,
  ...
}:
let
  cfg = config.heitor;
in
{
  options.heitor.configurations = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { name, ... }:
        {
          options = {
            modules = lib.mkOption {
              type = with lib.types; listOf anything;
              example = lib.literalExpression ''
                [
                  {
                    nix.settings = {
                      auto-optimise-store = true;
                      experimental-features = [
                        "flakes"
                        "nix-command"
                      ];
                    };

                    system.stateVersion = "25.05";
                  }

                  (
                    { inputs', ... }:
                    {
                      nix.package = inputs'.nix.packages.default;
                    }
                  )
                ];
              '';
              description = ''
                A list of Nix modules or inline configurations to include in the setup.
              '';
            };
            name = lib.mkOption {
              type = lib.types.str;
              default = name;
              example = "my-computer";
              description = ''
                The identifier for the configuration.
                This is used for referencing and organizing configurations in the flake.
              '';
            };
            system = lib.mkOption {
              type = lib.types.enum lib.systems.flakeExposed;
              example = "x86_64-linux";
              description = ''
                The target system architecture for the configuration.
              '';
            };
            type = lib.mkOption {
              type = lib.types.enum [
                "home-manager"
                "nix-darwin"
                "nixos"
              ];
              example = "nixos";
              description = ''
                Specifies the type of configuration to generate.
              '';
            };
          };
        }
      )
    );
    default = { };
    example = lib.literalExpression ''
      {
        my-computer = {
          modules = [
            ./configuration.nix
            {
              nix.settings = {
                auto-optimise-store = true;
                experimental-features = [
                  "flakes"
                  "nix-command"
                ];
              };

              system.stateVersion = "25.05";
            }
            (
              { inputs', ... }:
              {
                nix.package = inputs'.nix.packages.default;
              }
            )
          ];
          system = "x86_64-linux";
          type = "nixos";
        };

        heitor-at-my-computer = {
          modules = [ ./home.nix ];
          name = "heitor@my-computer";
          system = "x86_64-linux";
          type = "home-manager";
        };
      }
    '';
    description = ''
      A attribute set of configurations for the flake.
      Each configuration can represent a NixOS system, a home-manager setup or a nix-darwin setup.

      NixOS and `nix-darwin` automatically setup home-manager module for managing user configurations.
    '';
  };

  config.flake =
    let
      configurationsByType = lib.foldlAttrs (
        acc: _: value:
        lib.recursiveUpdate acc {
          ${value.type} = {
            ${value.name} = builtins.removeAttrs value [
              "name"
              "type"
            ];
          };
        }
      ) { } cfg.configurations;
    in
    lib.mkIf (cfg.configurations != { }) (
      lib.mkMerge [
        (lib.mkIf (configurationsByType ? home-manager) {
          homeConfigurations = builtins.mapAttrs (
            _: value:
            withSystem value.system (
              { inputs', self', ... }:
              inputs.home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = {
                  inherit (inputs) self;
                  inherit inputs inputs' self';
                };

                modules = builtins.attrValues inputs.self.homeManagerModules ++ value.modules;

                pkgs = import inputs.nixpkgs {
                  inherit (value) system;
                  config.allowUnfree = true;
                };
              }
            )
          ) configurationsByType.home-manager;
        })

        (lib.mkIf (configurationsByType ? nix-darwin) {
          darwinConfigurations = builtins.mapAttrs (
            _: value:
            withSystem value.system (
              { inputs', self', ... }:
              inputs.nix-darwin.lib.darwinSystem {
                modules = [
                  inputs.home-manager.darwinModules.home-manager
                  {
                    home-manager = {
                      backupFileExtension = "old";
                      extraSpecialArgs = {
                        inherit (inputs) self;
                        inherit inputs inputs' self';
                      };
                      useGlobalPkgs = true;
                      useUserPackages = true;
                    };
                  }
                ] ++ value.modules;
                specialArgs = {
                  inherit (inputs) self;
                  inherit inputs inputs' self';
                };
              }
            )
          ) configurationsByType.nix-darwin;
        })

        (lib.mkIf (configurationsByType ? nixos) {
          nixosConfigurations = builtins.mapAttrs (
            _: value:
            withSystem value.system (
              { inputs', self', ... }:
              inputs.nixpkgs.lib.nixosSystem {
                modules =
                  [
                    inputs.home-manager.nixosModules.home-manager
                    {
                      home-manager = {
                        backupFileExtension = "old";
                        extraSpecialArgs = {
                          inherit (inputs) self;
                          inherit inputs inputs' self';
                        };
                        useGlobalPkgs = true;
                        useUserPackages = true;
                      };
                    }
                  ]
                  ++ builtins.attrValues inputs.self.nixosModules
                  ++ value.modules;
                specialArgs = {
                  inherit (inputs) self;
                  inherit inputs inputs' self';
                };
              }
            )
          ) configurationsByType.nixos;
        })
      ]
    );
}
