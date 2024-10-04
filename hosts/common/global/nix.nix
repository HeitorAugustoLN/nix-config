{ inputs, lib, ... }:
let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
in
{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      extra-substituters = [ "https://nix-community.cachix.org" ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      flake-registry = ""; # Disable global flake registry
      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    # Add each flake input as a registry and nix_path
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlay
    ] ++ (builtins.attrValues inputs.self.overlays);
    config = {
      allowUnfree = true;
    };
  };
}
