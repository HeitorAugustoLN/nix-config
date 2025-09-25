{ config, ... }:
{
  programs.git = {
    enable = true;

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

    includes = [
      {
        condition = "hasconfig:remote.*.url:*github.com*";
        contents.user.email = "44377258+HeitorAugustoLN@users.noreply.github.com";
      }
      {
        condition = "hasconfig:remote.*.url:*codeberg.org*";
        contents.user.email = "heitor@noreply.codeberg.org";
      }
    ];

    userName = "Heitor Augusto";
  };
}
