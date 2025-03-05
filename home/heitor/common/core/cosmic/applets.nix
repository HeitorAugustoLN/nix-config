{
  config,
  cosmicLib,
  pkgs,
  ...
}:
let
  inherit (builtins) elem;
  inherit (cosmicLib) optionals;
  inherit (cosmicLib.cosmic) mkRon;
in
{
  wayland.desktopManager.cosmic.applets = {
    app-list = {
      enable_drag_source = false;

      favorites =
        [ "com.system76.CosmicFiles" ]
        ++ optionals config.programs.ghostty.enable [ "com.mitchellh.ghostty" ]
        ++ optionals config.programs.brave.enable [ "Brave-browser" ]
        ++ optionals (elem pkgs.spotify config.home.packages) [ "spotify" ];

      filter_top_levels = mkRon "optional" null;
    };

    audio.show_media_controls_in_top_panel = false;

    time = {
      first_day_of_week = 6; # Sunday
      military_time = true;
      show_date_in_top_panel = true;
      show_seconds = false;
      show_weekday = true;
    };
  };
}
