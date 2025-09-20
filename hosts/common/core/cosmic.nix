{
  environment = {
    sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  };

  networking.networkmanager.enable = true;

  services = {
    desktopManager.cosmic.enable = true;
  };
}
