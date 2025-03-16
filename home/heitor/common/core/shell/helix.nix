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
      lldb

      # Markdown
      marksman

      # Nix
      nixfmt-rfc-style
      nixd

      # Rust
      rust-analyzer
      rustfmt

      # Scheme
      steel

      # TOML
      taplo

      zig
      zls
    ];

    languages = {
      language = [
        {
          name = "nix";
          language-servers = singleton "nixd";
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
          config =
            let
              flake = ''(builtins.getFlake "${self}")'';
            in
            {
              formatting.command = "nixfmt";
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";

              options =
                let
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
      bufferline = "multiple";
      color-modes = true;
      cursorline = true;
      indent-guides.render = true;
      line-number = "relative";
      lsp.display-inlay-hints = true;

      statusline.mode = {
        normal = "NORMAL";
        insert = "INSERT";
        select = "SELECT";
      };
    };
  };
}
