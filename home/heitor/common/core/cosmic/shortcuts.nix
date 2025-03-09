{ config, cosmicLib, ... }:
let
  inherit (cosmicLib) getExe optionals;
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.systemActions = optionals config.programs.ghostty.enable (
    mkRON "map" [
      {
        key = mkRON "enum" "Terminal";
        value = getExe config.programs.ghostty.package;
      }
    ]
  );
}
