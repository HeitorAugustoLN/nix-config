{
  config,
  cosmicLib,
  pkgs,
  ...
}:
let
  inherit (builtins) readFile;
  inherit (cosmicLib.cosmic) fromRON mkRON;
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
        stretch = mkRON "enum" "Normal";
        style = mkRON "enum" "Normal";
        weight = mkRON "enum" "Normal";
      };

      monospace_font = {
        family = "JetBrains Mono";
        stretch = mkRON "enum" "Normal";
        style = mkRON "enum" "Normal";
        weight = mkRON "enum" "Normal";
      };
    };
  };
}
