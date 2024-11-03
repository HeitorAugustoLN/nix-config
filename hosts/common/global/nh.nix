{
  programs.nh = {
    enable = true;
    flake = "/home/heitor/Projetos/nix-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 3";
    };
  };
}
