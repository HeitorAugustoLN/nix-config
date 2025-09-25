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

    includes =
      let
        githubEmail = "44377258+HeitorAugustoLN@users.noreply.github.com";
      in
      [
        {
          condition = "hasconfig:remote.*.url:git@github.com:*/**";
          contents.user.email = githubEmail;
        }
      ];

    userName = "Heitor Augusto";
  };
}
