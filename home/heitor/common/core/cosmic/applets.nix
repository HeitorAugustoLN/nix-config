{ cosmicLib, ... }:
let
  inherit (cosmicLib.cosmic) mkRON;
in
{
  wayland.desktopManager.cosmic.applets = {
    app-list.settings = {
      enable_drag_source = false;

      favorites = [
        "com.system76.CosmicFiles"
        "com.mitchellh.ghostty"
        "Brave-browser"
        "spotify"
      ];

      filter_top_levels = mkRON "optional" null;
    };

    audio.settings.show_media_controls_in_top_panel = false;

    time.settings = {
      first_day_of_week = 6; # Sunday
      military_time = true;
      show_date_in_top_panel = true;
      show_seconds = false;
      show_weekday = true;
    };
  };
}
