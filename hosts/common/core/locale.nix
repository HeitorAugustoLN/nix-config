{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  i18n = {
    defaultLocale = mkDefault "pt_BR.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = mkDefault "pt_BR.UTF-8";
      LC_IDENTIFICATION = mkDefault "pt_BR.UTF-8";
      LC_MEASUREMENT = mkDefault "pt_BR.UTF-8";
      LC_MONETARY = mkDefault "pt_BR.UTF-8";
      LC_NAME = mkDefault "pt_BR.UTF-8";
      LC_NUMERIC = mkDefault "pt_BR.UTF-8";
      LC_PAPER = mkDefault "pt_BR.UTF-8";
      LC_TELEPHONE = mkDefault "pt_BR.UTF-8";
      LC_TIME = mkDefault "pt_BR.UTF-8";
    };
  };

  location.provider = "geoclue2";

  time = {
    hardwareClockInLocalTime = true;
    timeZone = mkDefault "America/Sao_Paulo";
  };
}
