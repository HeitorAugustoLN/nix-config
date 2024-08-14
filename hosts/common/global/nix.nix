{
  inputs,
  lib,
  ...
}: let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in {
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +3"; # Keep the last 3 generations
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      flake-registry = ""; # Disable global flake registry
      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    # Add each flake input as a registry and nix_path
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
  };

  nixpkgs = {
    overlays = builtins.attrValues inputs.self.overlays;
    config = {
      allowUnfree = true;
    };
  };
}
