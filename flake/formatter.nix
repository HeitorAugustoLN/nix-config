{ inputs, lib, ... }:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        programs = {
          deadnix.enable = true;
          just.enable = true;
          keep-sorted.enable = true;
          nixfmt.enable = true;

          prettier = {
            enable = true;
            includes = [ "*.md" ];
          };

          shellcheck.enable = true;
          shfmt.enable = true;
          statix.enable = true;

          yamlfmt =
            let
              importYAML =
                file:
                let
                  json = pkgs.runCommand "converted.json" { nativeBuildInputs = [ pkgs.yj ]; } ''
                    # shellcheck disable=SC2154,SC2188
                    set -e
                    yj < ${file} > "$out"
                  '';
                in
                lib.importJSON json;
            in
            {
              enable = true;
              settings = importYAML ../.yamlfmt.yaml;
            };
        };

        settings.on-unmatched = "info";
      };
    };
}
