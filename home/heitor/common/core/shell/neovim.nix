{ inputs', self, ... }:
let
  configuration = inputs'.neovim.nixvimConfigurations.default;

  extendedConfiguration = configuration.extendModules {
    modules = [
      {
        plugins.lsp.servers.nixd.settings.options =
          let
            flake = ''(builtins.getFlake "${self}")'';
            nixos.expr = "${flake}.nixosConfigurations.axolotl.options";
          in
          {
            inherit nixos;
            home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
          };
      }
    ];
  };

  inherit (extendedConfiguration.config.build) package;
in
{
  home = {
    sessionVariables.EDITOR = "nvim";
    packages = [ package ];
  };
}
