{
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
    nix-index.enable = true;
    nix-index-database.comma.enable = true;
  };
}
