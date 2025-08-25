{ config, ... }:
{
  unify.hosts.nixos.axolotl = {
    modules = builtins.attrValues {
      inherit (config.unify.modules)
        builders
        disko
        facter
        gnome
        heitor
        protonvpn
        ;
    };

    users.heitor.modules = builtins.attrValues {
      inherit (config.unify.modules)
        gnome
        heitor
        "heitor.ghostty"
        "heitor.neovim"
        protonvpn
        ;
    };
  };
}
