{
  programs.git = {
    enable = true;

    settings = {
      color.ui = true;
      core.editor = "nvim";
      init.defaultBranch = "main";
      user.name = "Heitor Augusto";
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
  };

  programs.jujutsu = {
    enable = true;

    settings = {
      user = {
        name = "Heitor Augusto";
        email = "44377258+HeitorAugustoLN@users.noreply.github.com";
      };

      ui.default-editor = "nvim";

      signing = {
        sign-all = true;
        backend = "gpg";
        key = "3EEC05B0024AF8A4";
      };
    };
  };
}
