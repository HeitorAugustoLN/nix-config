{ cosmicLib, ... }:
let
  inherit (cosmicLib) mkDefault;
  inherit (cosmicLib.cosmic) mkRon;
in
{
  wayland.desktopManager.cosmic.compositor = {
    active_hint = true;
    autotile = true;
    autotile_behavior = mkRon "enum" "PerWorkspace";
    descale_xwayland = false;
    focus_follows_cursor = false;

    input_default = {
      acceleration = mkRon "optional" {
        profile = mkRon "optional" (mkRon "enum" "Flat");
        speed = 0.0;
      };

      state = mkRon "enum" "Enabled";
    };

    workspaces = {
      workspace_layout = mkRon "enum" "Horizontal";
      workspace_mode = mkRon "enum" "OutputBound";
    };

    xkb_config = {
      layout = mkDefault "br";
      model = mkDefault "pc104";
      options = mkDefault (mkRon "optional" "terminate:ctrl_alt_bksp");
      repeat_delay = 600;
      repeat_rate = 25;
      rules = "";
      variant = mkDefault "";
    };
  };
}
