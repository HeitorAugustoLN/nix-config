{lib, ...}: {
  time = {
    hardwareClockInLocalTime = lib.mkDefault true;
    timeZone = lib.mkDefault "America/Sao_Paulo";
  };

  location.provider = "geoclue2";

  i18n = {
    defaultLocale = lib.mkDefault "pt_BR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = lib.mkDefault "pt_BR.UTF-8";
      LC_IDENTIFICATION = lib.mkDefault "pt_BR.UTF-8";
      LC_MEASUREMENT = lib.mkDefault "pt_BR.UTF-8";
      LC_MONETARY = lib.mkDefault "pt_BR.UTF-8";
      LC_NAME = lib.mkDefault "pt_BR.UTF-8";
      LC_NUMERIC = lib.mkDefault "pt_BR.UTF-8";
      LC_PAPER = lib.mkDefault "pt_BR.UTF-8";
      LC_TELEPHONE = lib.mkDefault "pt_BR.UTF-8";
      LC_TIME = lib.mkDefault "pt_BR.UTF-8";
    };
    supportedLocales = lib.mkDefault [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
    ];
  };
}
