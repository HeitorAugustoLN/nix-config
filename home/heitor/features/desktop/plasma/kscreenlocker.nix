{ config, ... }:
{
  programs.plasma.kscreenlocker = {
    appearance = {
      alwaysShowClock = true;
      showMediaControls = false;
      wallpaper = config.programs.plasma.workspace.wallpaper;
    };

    autoLock = true;
    lockOnResume = true;
    lockOnStartup = false;
    passwordRequired = true;
    passwordRequiredDelay = 10;
    timeout = 10;
  };
}
