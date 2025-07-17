{ config, ... }:
{
  programs.jujutsu = {
    inherit (config.programs.git) enable;

    settings = {
      email = config.programs.git.userEmail;
      name = config.programs.git.userName;
    };
  };
}
