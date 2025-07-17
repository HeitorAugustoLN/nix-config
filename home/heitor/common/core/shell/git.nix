{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitMinimal;

    extraConfig = {
      color.ui = true;
      core.editor = config.home.sessionVariables.EDITOR;
      init.defaultBranch = "main";
    };

    signing = {
      format = "openpgp";
      key = "53C04F8F46A1A344";
      signByDefault = true;
    };

    userEmail = "IAm.HeitorALN@proton.me";
    userName = "Heitor Augusto";
  };
}
