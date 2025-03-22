{
  cosmicLib,
  inputs,
  pkgs,
  ...
}:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  home = {
    packages = with pkgs; [
      spotify
      stremio
    ];

    stateVersion = "25.05";
  };

  wayland.desktopManager.cosmic = {
    idle = {
      screen_off_time = mkRON "optional" null;
      suspend_on_ac_time = mkRON "optional" null;
      suspend_on_battery_time = mkRON "optional" null;
    };

    wallpapers = [
      {
        filter_by_theme = false;
        filter_method = mkRON "enum" "Lanczos";
        output = "HDMI-A-1";
        rotation_frequency = 300;
        sampling_method = mkRON "enum" "Alphanumeric";
        scaling_mode = mkRON "enum" "Zoom";

        source = mkRON "enum" {
          variant = "Path";
          value = [ inputs.wallpapers.desktop.by-theme.catppuccin.mocha.digital-art.eclipse ];
        };
      }
    ];
  };
}
