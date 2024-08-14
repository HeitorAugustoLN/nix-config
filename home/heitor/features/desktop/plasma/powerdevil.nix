{
  programs.plasma.powerdevil = {
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
  };
}
