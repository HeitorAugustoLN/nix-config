{
  imports = [
    ./global

    ./features/apps/browsers/firefox.nix

    ./features/apps/communication/discord.nix

    ./features/apps/editors/neovim.nix

    ./features/apps/media/kdenlive.nix
    ./features/apps/media/mpv.nix
    ./features/apps/media/obs-studio.nix
    ./features/apps/media/spotify.nix
    ./features/apps/media/stremio.nix

    ./features/apps/productivity/libreoffice.nix
    ./features/apps/productivity/obsidian.nix

    ./features/shell

    ./features/desktop/plasma

    ./features/gaming/bottles.nix
    ./features/gaming/heroic.nix
    ./features/gaming/mangohud.nix
    ./features/gaming/minecraft.nix
  ];

  programs.plasma = {
    input = {
      keyboard = {
        layouts = [
          {
            layout = "br";
          }
        ];
        model = "pc104";
        numlockOnStartup = "on";
        switchingPolicy = "global";
      };
      mice = [
        {
          accelerationProfile = "none";
          enable = true;
          leftHanded = false;
          middleButtonEmulation = false;
          name = "Logitech G403 HERO Gaming Mouse";
          naturalScroll = false;
          productId = "c08f";
          vendorId = "046d";
        }
      ];
    };
    powerdevil = {
      AC = {
        autoSuspend = {
          action = "sleep";
          idleTimeout = 1800;
        };
        powerButtonAction = "showLogoutScreen";
        turnOffDisplay = {
          idleTimeout = 900;
          idleTimeoutWhenLocked = 60;
        };
      };
      general.pausePlayersOnSuspend = true;
    };
  };

  home.stateVersion = "24.11";
}
