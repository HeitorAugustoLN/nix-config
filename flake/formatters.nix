{ inputs, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];
  perSystem.treefmt = {
    flakeCheck = true;

    programs = {
      deadnix.enable = true;
      deno.enable = true;
      nixfmt.enable = true;
      statix.enable = true;
    };

    projectRootFile = "flake.nix";
  };
}
