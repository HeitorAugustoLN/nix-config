{
  config,
  cosmicLib,
  pkgs,
  ...
}:
let
  inherit (builtins) readFile;
  inherit (cosmicLib.cosmic) fromRON mkRon;
in
{
  home.packages = with pkgs; [
    (catppuccin-papirus-folders.override { inherit (config.catppuccin) flavor accent; })
    inter
    jetbrains-mono
  ];

  wayland.desktopManager.cosmic.appearance = {
    theme =
      let
        importRON = path: path |> readFile |> fromRON;
      in
      {
        dark = importRON ./catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-round.ron;
        mode = "dark";
      };

    toolkit = {
      apply_theme_global = true;
      icon_theme = "Papirus-Dark";

      interface_font = {
        family = "Inter";
        stretch = mkRon "enum" "Normal";
        style = mkRon "enum" "Normal";
        weight = mkRon "enum" "Normal";
      };

      monospace_font = {
        family = "JetBrains Mono";
        stretch = mkRon "enum" "Normal";
        style = mkRon "enum" "Normal";
        weight = mkRon "enum" "Normal";
      };
    };
  };
}
