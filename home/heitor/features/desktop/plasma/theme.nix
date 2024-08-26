{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  catppuccinAccent = config.catppuccin.accent;
  catppuccinFlavor = config.catppuccin.flavor;
in {
  home.packages = with pkgs; [
    (catppuccin-papirus-folders.override {
      accent = catppuccinAccent;
      flavor = catppuccinFlavor;
    })
    (catppuccin-kde.override {
      accents = ["${catppuccinAccent}"];
      flavour = ["${catppuccinFlavor}"];
    })
    inter
    bibata-cursors
    fira-code
  ];

  programs.plasma = {
    desktop.widgets = [
      {
        digitalClock = {
          position = {
            horizontal = 1650;
            vertical = 40;
          };
          size = {
            width = 225;
            height = 200;
          };

          # Digital clock settings
          calendar = {
            firstDayOfWeek = "sunday";
            plugins = [
              "astronomicalevents"
              "holidaysevents"
            ];
            showWeekNumbers = true;
          };

          date = {
            enable = true;
            format = "longDate";
            position = "belowTime";
          };

          time = {
            format = "24h";
            showSeconds = "never";
          };

          timeZone = {
            alwaysShow = false;
            changeOnScroll = false;
            lastSelected = "America/Sao_Paulo";
            selected = [
              "America/Sao_Paulo"
              "UTC"
            ];
          };
        };
      }
    ];
    fonts = {
      general = {
        family = "Inter";
        pointSize = 10;
      };
      fixedWidth = {
        family = "Fira Code";
        pointSize = 10;
      };
      small = {
        family = "Inter";
        pointSize = 8;
      };
      toolbar = {
        family = "Inter";
        pointSize = 10;
      };
      menu = {
        family = "Inter";
        pointSize = 10;
      };
      windowTitle = {
        family = "Inter";
        pointSize = 10;
      };
    };
    workspace = {
      clickItemTo = "open";
      colorScheme = let
        capitalizeWord = word: let
          firstLetter = builtins.substring 0 1 word;
          rest = builtins.substring 1 (builtins.stringLength word - 1) word;
        in "${lib.toUpper firstLetter}${rest}";
      in "Catppuccin${capitalizeWord catppuccinFlavor}${capitalizeWord catppuccinAccent}";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
      };
      iconTheme = "Papirus-Dark";
      lookAndFeel = "org.kde.breezedark.desktop";
      soundTheme = "ocean";
      theme = "default";
      tooltipDelay = 500;
      wallpaper = inputs.wallpapers.desktop.by-theme.catppuccin.mocha.digital-art.eclipse;
    };
  };
}
