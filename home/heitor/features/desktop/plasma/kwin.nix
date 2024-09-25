{ lib, ... }:
{
  programs.plasma.kwin = {
    effects = {
      desktopSwitching.animation = "slide";
      minimization.animation = "squash";
      shakeCursor.enable = true;
      windowOpenClose.animation = "fade";
    };
    nightLight = {
      enable = true;
      mode = "times";
      temperature = {
        day = 5000;
        night = 1900;
      };
      time = {
        evening = "18:30";
        morning = "06:30";
      };
      transitionTime = 90;
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
    virtualDesktops =
      let
        number = 10;
      in
      {
        names = map (n: "Área de trabalho ${toString n}") (lib.range 1 number);
        inherit number;
        rows = 1;
      };
  };
}
