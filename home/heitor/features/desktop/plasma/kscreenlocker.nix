{
  programs.plasma.kscreenlocker = {
    appearance = {
      alwaysShowClock = true;
      showMediaControls = false;
      wallpaperPictureOfTheDay.provider = "apod";
    };

    autoLock = true;
    lockOnResume = true;
    lockOnStartup = false;
    passwordRequired = true;
    passwordRequiredDelay = 10;
    timeout = 10;
  };
}
