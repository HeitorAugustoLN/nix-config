{
  inputs',
  lib,
  pkgs,
  self,
  ...
}:
let
  inherit (lib) getExe';
in
{
  catppuccin.helix.enable = true;

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs'.helix.packages.helix;

    extraPackages = with pkgs; [
      # Clipboard provider
      wl-clipboard-rs

      # Debugger for many languages (C, C++, Rust, Zig, etc.)
      lldb

      # GDScript
      gdtoolkit_4

      # Lua
      lua-language-server
      stylua

      # Markdown
      marksman

      # Nix
      nixd
      nixfmt-rfc-style

      # Rust
      rust-analyzer
      rustfmt

      # Scheme
      steel

      # TOML
      taplo

      # Zig
      zig
      zls
    ];

    languages = {
      language = [
        {
          name = "lua";

          formatter = {
            command = "stylua";
            args = [
              "--search-parent-directories"
              "--respect-ignores"
              "-"
            ];
          };

          language-servers = [ "lua-language-server" ];
        }
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

          language-servers = [ "steel-language-server" ];
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

    settings = {
      editor = {
        bufferline = "multiple";
        clipboard-provider = "wayland";
        color-modes = true;
        cursorline = true;
        indent-guides.render = true;
        line-number = "relative";
        lsp.display-inlay-hints = true;
      };

      keys.normal."'" = "switch_to_uppercase";
    };
  };
}
