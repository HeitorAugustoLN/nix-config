{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nix-index-database.hmModules.nix-index ];

  home = {
    packages = with pkgs; [
      nix-init
      nix-output-monitor
      nix-tree
      nix-update
      nixpkgs-review
    ];

    sessionVariables.NIXPKGS_ALLOW_UNFREE = 1;
  };

  programs = {
    nix-index = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableZshIntegration = config.programs.zsh.enable;
    };

    nix-index-database.comma.enable = true;
  };
}
