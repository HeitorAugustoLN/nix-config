{
  imports = [
    ./global

    ./features/desktop/plasma
    ./features/git.nix
    ./features/apps/browsers/firefox.nix
    ./features/apps/media/spotify.nix
    ./features/apps/media/stremio.nix
    ./features/neovim.nix
    ./features/qemu.nix
  ];

  programs.plasma.input = {
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

  home.stateVersion = "24.11";
}
