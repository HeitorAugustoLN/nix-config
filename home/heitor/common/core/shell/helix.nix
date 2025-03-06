{
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) getExe' singleton;
in
{
  catppuccin.helix.enable = true;

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixfmt-rfc-style
      nixd
      rust-analyzer
      rustfmt
      steel
    ];

    languages = {
      language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
        }
        {
          auto-format = true;
          name = "scheme";

          formatter = {
            command = getExe' pkgs.racket-minimal "raco";

            args = [
              "fmt"
              "-i"
            ];
          };

          language-servers = singleton "steel-language-server";
        }
      ];

      language-server = {
        nixd = {
          command = "nixd";
          config = {
            formatting.command = "nixfmt";

            options =
              let
                flake = ''(builtins.getFlake "${self}")'';
                nixos.expr = "${flake}.nixosConfigurations.axolotl.options";
              in
              {
                inherit nixos;
                home-manager.expr = "${nixos.expr}.home-manager.users.type.getSubOptions [ ]";
              };
          };
        };

        steel-language-server.command = "steel-language-server";
      };
    };

    settings.editor = {
      bufferline = true;
      color-modes = true;
      cursorline = true;
      indent-guides.render = true;
      line-number = true;
      lsp.display-inlay-hints = true;
    };
  };
}
