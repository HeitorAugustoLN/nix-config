{ config, ... }:
let
  shared = builtins.attrValues {
    inherit (config.unify.modules)
      gnome
      heitor
      protonvpn
      ;
  };
in
{
  unify.hosts.nixos.axolotl = {
    modules =
      shared
      ++ builtins.attrValues {
        inherit (config.unify.modules)
          builders
          disko
          facter
          ;
      };

    users.heitor.modules =
      shared
      ++ builtins.attrValues {
        inherit (config.unify.modules)
          "heitor.ghostty"
          "heitor.neovim"
          ;
      };
  };
}
