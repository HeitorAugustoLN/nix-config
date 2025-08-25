{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt.programs = {
        deadnix.enable = true;

        dprint = {
          enable = true;
          includes = [ "*.md" ];
          settings.plugins = pkgs.dprint-plugins.getPluginList (p: [ p.dprint-plugin-markdown ]);
        };

        nixfmt.enable = true;
        statix.enable = true;
        yamlfmt.enable = true;
      };
    };
}
