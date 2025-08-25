{
  unify.modules.gnome = {
    nixos.services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

    home.qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style.name = "adwaita";
    };
  };
}
