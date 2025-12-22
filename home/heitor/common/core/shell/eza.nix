{
  programs = {
    eza = {
      enable = true;
      enableFishIntegration = false;
    };

    fish.shellAbbrs =
      let
        ls = "eza --icons --git";
      in
      {
        la = "${ls} --all";
        ll = "${ls} --long";
        lla = "${ls} --long --all";
        inherit ls;
        lt = "${ls} --tree";
      };

    zsh.shellAliases =
      let
        ls = "eza --icons --git";
      in
      {
        la = "${ls} --all";
        ll = "${ls} --long";
        lla = "${ls} --long --all";
        inherit ls;
        lt = "${ls} --tree";
      };
  };
}
