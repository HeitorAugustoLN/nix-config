{
  programs.plasma = {
    configFile."plasma_calendar_astronomicalevents".General = {
      showLunarPhase = true;
      showSeason = true;
    };
    configFile."plasma_calendar_holiday_regions".General.selectedRegions = "br_pt-br";

    panels = [
      # Dock
      {
        alignment = "center";
        floating = true;
        height = 60;
        hiding = "dodgewindows";
        lengthMode = "fit";
        location = "bottom";
        screen = "all";
        widgets = [
          {
            iconTasks = {
              appearance = {
                fill = false;
                highlightWindows = true;
                iconSpacing = "medium";
                indicateAudioStreams = true;
                rows = {
                  multirowView = "never";
                  maximum = null;
                };
                showTooltips = true;
              };
              behavior = {
                grouping = {
                  clickAction = "showPresentWindowsEffect";
                  method = "byProgramName";
                };
                middleClickAction = "newInstance";
                minimizeActiveTaskOnClick = true;
                newTasksAppearOn = "right";
                showTasks = {
                  onlyInCurrentActivity = true;
                  onlyInCurrentDesktop = true;
                  onlyMinimized = false;
                  onlyInCurrentScreen = false;
                };
                sortingMethod = "manually";
                unhideOnAttentionNeeded = true;
                wheel = {
                  ignoreMinimizedTasks = true;
                  switchBetweenTasks = true;
                };
              };
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "preferred://browser"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            plasmusicToolbar = {
              musicControls = {
                showPlaybackControls = true;
                volumeStep = 1;
              };
              panelIcon = {
                albumCover = {
                  useAsIcon = false;
                  radius = 8;
                };
                icon = "view-media-track";
              };
              preferredSource = "any";
              songText = {
                displayInSeparateLines = true;
                maximumWidth = 600;
                scrolling = {
                  behavior = "alwaysScrollExceptOnHover";
                  enable = true;
                  resetOnPause = true;
                  speed = 3;
                };
              };
            };
          }
        ];
      }
      # Top panel
      {
        alignment = "center";
        floating = true;
        height = 26;
        hiding = "none";
        lengthMode = "fill";
        location = "top";
        screen = "all";
        widgets = [
          {
            kickoff = {
              applicationsDisplayMode = "list";
              compactDisplayStyle = false;
              favoritesDisplayMode = "grid";
              icon = "nix-snowflake";
              label = null;
              pin = false;
              showActionButtonCaptions = true;
              showButtonsFor = "power";
              sidebarPosition = "right";
              sortAlphabetically = true;
            };
          }
          {
            applicationTitleBar = {
              behavior = {
                activeTaskSource = "activeTask";
                disableButtonsForNotHovered = false;
                disableForNotMaximized = false;
                filterByActivity = true;
                filterByScreen = true;
                filterByVirtualDesktop = true;
              };
              layout = {
                elements = ["windowTitle"];
                fillFreeSpace = false;
                horizontalAlignment = "left";
                showDisabledElements = "deactivated";
                spacingBetweenElements = 0;
                verticalAlignment = "center";
                widgetMargins = 1;
              };
              overrideForMaximized.enable = false;
              windowControlButtons = {
                auroraeTheme = null;
                buttonsAnimationSpeed = 100;
                buttonsAspectRatio = 100;
                buttonsMargin = 0;
                iconSource = "plasma";
              };
              windowTitle = {
                font = {
                  bold = false;
                  fit = "fixedSize";
                  size = 12;
                };
                hideEmptyTitle = true;
                margins = {
                  bottom = 0;
                  left = 10;
                  right = 5;
                  top = 0;
                };
                maximumWidth = 640;
                minimumWidth = 0;
                source = "appName";
                undefinedWindowTitle = "";
              };
            };
          }
          {
            name = "org.kde.plasma.appmenu";
            config.Appearance.compactView = false;
          }
          {
            name = "org.kde.plasma.panelspacer";
            config.General = {
              expanding = true;
              lenght = -1;
            };
          }
          {
            systemTray = {
              icons = {
                scaleToFit = true;
                spacing = "small";
              };
              pin = false;
            };
          }
          {
            digitalClock = {
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
                position = "besideTime";
              };
              font = {
                bold = false;
                family = "Inter";
                italic = false;
                size = 12;
                weight = 400;
              };
              time = {
                format = "24h";
                showSeconds = "onlyInTooltip";
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
      }
    ];
  };
}
