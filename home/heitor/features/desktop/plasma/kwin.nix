{
  config,
  lib,
  ...
}:
{
  programs.plasma.kwin = {
    effects = {
      desktopSwitching.animation = "slide";
      minimization = {
        animation = "squash";
      };
      shakeCursor.enable = true;
      windowOpenClose.animation = "fade";
    };
    nightLight = {
      enable = true;
      mode = "times";
      temperature = {
        day = 6500;
        night = 1900;
      };
      time = {
        evening = "19:00";
        morning = "08:00";
      };
      transitionTime = 300;
    };

    titlebarButtons = {
      left = [
        "close"
        "minimize"
        "maximize"
        "on-all-desktops"
      ];
      right = [
        "help"
        "more-window-actions"
      ];
    };
    virtualDesktops = {
      names =
        let
          number = config.programs.plasma.kwin.virtualDesktops.number;
          rows = config.programs.plasma.kwin.virtualDesktops.rows;
        in
        map (n: "Workspace ${toString n}") (lib.range 1 (number * rows));
      number = 4;
      rows = 1;
    };
  };
}
