{ config, cosmicLib, ... }:
let
  inherit (cosmicLib) optionals singleton;
  inherit (cosmicLib.cosmic) mkRon;
in
{
  wayland.desktopManager.cosmic.shortcuts = optionals config.programs.ghostty.enable [
    {
      action = mkRon "enum" {
        variant = "Spawn";
        value = singleton "ghostty";
      };

      description = mkRon "optional" "Open Ghostty";
      key = "Super+T";
    }
  ];
}
