{ config, cosmicLib, ... }:
let
  inherit (cosmicLib) optionals singleton;
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.shortcuts = optionals config.programs.ghostty.enable [
    {
      action = mkRON "enum" {
        variant = "Spawn";
        value = singleton "ghostty";
      };

      description = mkRON "optional" "Open Ghostty";
      key = "Super+T";
    }
  ];
}
