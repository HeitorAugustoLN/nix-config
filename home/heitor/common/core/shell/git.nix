{
  programs.git = {
    enable = true;

    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };

    userEmail = "IAm.HeitorALN@proton.me";
    userName = "Heitor Augusto";
  };
}
