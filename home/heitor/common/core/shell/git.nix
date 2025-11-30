{
  programs.git = {
    enable = true;

    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      init.defaultBranch = "main";
    };

    signing = {
      format = "openpgp";
      key = "3EEC05B0024AF8A4";
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
