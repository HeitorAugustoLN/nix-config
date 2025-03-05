{ cosmicLib, inputs, ... }:
let
  inherit (cosmicLib) singleton;
  inherit (cosmicLib.cosmic) mkRon;
in
{
  imports = [
    ../common/optional/brave.nix
    ../common/optional/cosmic
    ../common/optional/ghostty.nix
    ../common/optional/mpv.nix
    ../common/optional/spotify.nix
    ../common/optional/stremio.nix
  ];

  wayland.desktopManager.cosmic = {
    idle = {
      screen_off_time = mkRon "optional" null;
      suspend_on_ac_time = mkRon "optional" null;
      suspend_on_battery_time = mkRon "optional" null;
    };

    wallpapers = [
      {
        filter_by_theme = false;
        filter_method = mkRon "enum" "Lanczos";
        output = "HDMI-A-1";
        rotation_frequency = 300;
        sampling_method = mkRon "enum" "Alphanumeric";
        scaling_mode = mkRon "enum" "Zoom";

        source = mkRon "enum" {
          variant = "Path";
          value =
            inputs.wallpapers.desktop.by-theme.catppuccin.mocha.digital-art.eclipse |> toString |> singleton;
        };
      }
    ];
  };

  home.stateVersion = "24.11";
}
