{ config, cosmicLib, ... }:
let
  inherit (cosmicLib) getExe optionals;
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.systemActions = mkRON "map" (
    optionals config.programs.ghostty.enable [
      {
        key = mkRON "enum" "Terminal";
        value = getExe config.programs.ghostty.package;
      }
    ]
  );
}
