{ config, lib, ... }:
let
  virtualDesktopsAmount = builtins.length config.programs.plasma.kwin.virtualDesktops.names;
  shiftedNumbersMap = {
    "1" = "!";
    "2" = "@";
    "3" = "#";
    "4" = "$";
    "5" = "%";
    "6" = "F6";
    "7" = "&";
    "8" = "*";
    "9" = "(";
    "10" = ")";
  };
in
{
  programs.plasma.shortcuts = lib.mkMerge [
    {
      # Limited to 10 virtual desktops for intuitive shortcuts.
      kwin =
        (builtins.listToAttrs (
          map (number: {
            name = "Switch to Desktop ${toString number}";
            value = "Ctrl+Alt+${
              if number == 10 then
                "0"
              else if number > 10 then
                "none"
              else
                toString number
            }";
          }) (lib.range 1 virtualDesktopsAmount)
        ))
        // (builtins.listToAttrs (
          map (number: {
            name = "Window to Desktop ${toString number}";
            value = "Ctrl+Alt+${shiftedNumbersMap.${toString number} or "none"}";
          }) (lib.range 1 virtualDesktopsAmount)
        ))
        // (builtins.listToAttrs (
          map (number: {
            name = "Switch to Screen ${toString number}";
            value = "Meta+Alt+${
              if number == 10 then
                "0"
              else if number > 10 then
                "none"
              else
                toString number
            }";
          }) (lib.range 1 7) # 7 is the maximum number of screens for KDE Plasma
        ))
        // (builtins.listToAttrs (
          map (number: {
            name = "Window to Screen ${toString number}";
            value = "Meta+Alt+${shiftedNumbersMap.${toString number} or "none"}";
          }) (lib.range 1 7) # 7 is the maximum number of screens for KDE Plasma
        ));
    }
    {
      kwin = {
        "Switch One Desktop Down" = "Ctrl+Alt+J";
        "Switch One Desktop to the Left" = "Ctrl+Alt+H";
        "Switch One Desktop to the Right" = "Ctrl+Alt+L";
        "Switch One Desktop Up" = "Ctrl+Alt+K";

        "Switch to Next Screen" = "Meta+Alt+L";
        "Switch to Previous Screen" = "Meta+Alt+H";

        "Switch Window Down" = "Alt+J";
        "Switch Window Left" = "Alt+H";
        "Switch Window Right" = "Alt+L";
        "Switch Window Up" = "Alt+K";

        "Window One Desktop Down" = "Ctrl+Shift+Alt+J";
        "Window One Desktop to the Left" = "Ctrl+Shift+Alt+H";
        "Window One Desktop to the Right" = "Ctrl+Shift+Alt+L";
        "Window One Desktop Up" = "Ctrl+Shift+Alt+K";

        "Window Quick Tile Bottom" = "Alt+Shift+J";
        "Window Quick Tile Left" = "Alt+Shift+H";
        "Window Quick Tile Right" = "Alt+Shift+L";
        "Window Quick Tile Top" = "Alt+Shift+K";

        "Window to Next Screen" = "Meta+Shift+Alt+L";
        "Window to Previous Screen" = "Meta+Shift+Alt+H";
      };

      "services/org.kde.dolphin.desktop" = {
        _launch = "Meta+Alt+E";
      };

      "services/org.kde.krunner.desktop" = {
        _launch = "Alt+Space\tSearch";
      };
    }
    (lib.mkIf config.programs.firefox.enable {
      "services/firefox.desktop" = {
        new-window = "Meta+Alt+B";
      };
    })
    (lib.mkIf config.programs.konsole.enable {
      "services/org.kde.konsole.desktop" = {
        _launch = "Meta+Alt+T";
      };
    })
  ];
}
