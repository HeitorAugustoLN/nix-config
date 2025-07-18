{ config, ... }:
{
  programs.jujutsu = {
    inherit (config.programs.git) enable;

    settings.user = {
      email = config.programs.git.userEmail;
      name = config.programs.git.userName;
    };
  };
}
