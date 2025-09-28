{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem.treefmt.programs = {
    deadnix.enable = true;
    nixfmt.enable = true;
    prettier.enable = true;
    statix.enable = true;
  };
}
