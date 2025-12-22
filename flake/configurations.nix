{
  config,
  inputs,
  lib,
  self,
  withSystem,
  ...
}:
let
  inherit (builtins)
    attrValues
    hashString
    mapAttrs
    removeAttrs
    substring
    ;
  inherit (lib)
    foldlAttrs
    mkDefault
    mkIf
    mkMerge
    mkOption
    recursiveUpdate
    types
    ;
in
{
  options.nexus.configurations =
    let
      configurationSubmodule = types.submodule (
        { name, ... }:
        {
          options = {
            modules = mkOption {
              type = with types; listOf deferredModule;
              example = [
                {
                  nix.gc.automatic = true;
                  system.stateVersion = "25.05";
                }
              ];
              description = ''
                List of modules for the configuration.
              '';
            };

            name = mkOption {
              type = types.str;
              default = name;
              example = "my-configuration";
              description = ''
                Name of the configuration.
              '';
            };

            system = mkOption {
              type = types.enum lib.systems.flakeExposed;
              example = "x86_64-linux";
              description = ''
                System of the configuration.
              '';
            };

            type = mkOption {
              type = types.enum [
                "home-manager"
                "nixos"
              ];
              example = "nixos";
              description = ''
                Type of the configuration.
              '';
            };
          };
        }
      );
    in
    mkOption {
      type = types.attrsOf configurationSubmodule;
      default = { };
      example.my-configuration = {
        modules = [
          {
            nix.gc.automatic = true;
            system.stateVersion = "25.05";
          }
        ];
        system = "x86_64-linux";
        type = "nixos";
      };
      description = ''
        List of configurations.
      '';
      apply = foldlAttrs (
        acc: _: value:
        recursiveUpdate acc {
          ${value.type}.${value.name} = removeAttrs value [
            "name"
            "type"
          ];
        }
      ) { };
    };

  config.flake =
    let
      cfg = config.nexus;
    in
    mkIf (cfg.configurations != { }) (mkMerge [
      (mkIf (cfg.configurations ? home-manager) {
        homeConfigurations = mapAttrs (
          _: value:
          withSystem value.system (
            { inputs', self', ... }:
            inputs.home-manager.lib.homeManagerConfiguration {
              extraSpecialArgs = {
                inherit
                  inputs
                  inputs'
                  self
                  self'
                  ;
              };

              modules = attrValues self.homeManagerModules ++ value.modules;

              pkgs = import inputs.nixpkgs {
                inherit (value) system;
                config.allowUnfree = true;
              };
            }
          )
        ) cfg.configurations.home-manager;
      })

      (mkIf (cfg.configurations ? nixos) {
        nixosConfigurations = mapAttrs (
          name: value:
          withSystem value.system (
            { inputs', self', ... }:
            inputs.nixpkgs.lib.nixosSystem {
              modules = [
                ../hosts/common/core
                {
                  networking = {
                    hostName = mkDefault name;
                    hostId = mkDefault (substring 0 8 (hashString "md5" name));
                  };

                  nixpkgs.hostPlatform = value.system;
                }
              ]
              ++ attrValues self.nixosModules
              ++ value.modules;

              specialArgs = {
                inherit
                  inputs
                  inputs'
                  self
                  self'
                  ;
              };
            }
          )
        ) cfg.configurations.nixos;
      })
    ]);
}
