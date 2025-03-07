{ cosmicLib, ... }:
let
  inherit (cosmicLib) mkDefault;
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.compositor = {
    active_hint = true;
    autotile = true;
    autotile_behavior = mkRON "enum" "PerWorkspace";
    descale_xwayland = false;
    focus_follows_cursor = false;

    input_default = {
      acceleration = mkRON "optional" {
        profile = mkRON "optional" (mkRON "enum" "Flat");
        speed = 0.0;
      };

      state = mkRON "enum" "Enabled";
    };

    workspaces = {
      workspace_layout = mkRON "enum" "Horizontal";
      workspace_mode = mkRON "enum" "OutputBound";
    };

    xkb_config = {
      layout = mkDefault "br";
      model = mkDefault "pc104";
      options = mkDefault (mkRON "optional" "terminate:ctrl_alt_bksp");
      repeat_delay = 600;
      repeat_rate = 25;
      rules = "";
      variant = mkDefault "";
    };
  };
}
