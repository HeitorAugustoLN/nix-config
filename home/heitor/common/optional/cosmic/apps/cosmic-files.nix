{ config, cosmicLib, ... }:
let
  inherit (cosmicLib) singleton;
  inherit (cosmicLib.cosmic) mkRon;
in
{
  programs.cosmic-files = {
    enable = true;
    package = null;

    settings = {
      app_theme = mkRon "enum" "System";

      desktop = {
        grid_spacing = 100;
        icon_size = 100;
        show_content = false;
        show_mounted_drives = false;
        show_trash = false;
      };

      favorites = [
        (mkRon "enum" "Home")
        (mkRon "enum" "Documents")
        (mkRon "enum" "Downloads")
        (mkRon "enum" "Music")
        (mkRon "enum" "Pictures")
        (mkRon "enum" "Videos")
        (mkRon "enum" {
          variant = "Path";
          value = singleton "${config.home.homeDirectory}/Projects";
        })
      ];

      show_details = false;

      tab = {
        folders_first = true;

        icon_sizes = {
          grid = 100;
          list = 100;
        };

        show_hidden = true;
        view = mkRon "enum" "List";
      };
    };
  };
}
