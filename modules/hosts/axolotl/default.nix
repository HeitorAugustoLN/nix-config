{ config, ... }:
{
  unify.hosts.nixos.axolotl = {
    modules = builtins.attrValues {
      inherit (config.unify.modules)
        builders
        disko
        facter
        gnome
        protonvpn
        ;
    };

    users.heitor.modules = builtins.attrValues {
      inherit (config.unify.modules)
        gnome
        "heitor.ghostty"
        "heitor.neovim"
        protonvpn
        ;
    };
  };
}
