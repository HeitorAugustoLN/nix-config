{ inputs, lib, ... }:
let
  inherit (builtins) mapAttrs;
  inherit (lib)
    filterAttrs
    isType
    mapAttrsToList
    mkDefault
    ;
in
{
  nix =
    let
      flakeInputs = filterAttrs (_: isType "flake") inputs;
    in
    {
      channel.enable = false;
      daemonCPUSchedPolicy = mkDefault "batch";
      daemonIOSchedClass = mkDefault "idle";
      daemonIOSchedPriority = mkDefault 7;
      nixPath = mapAttrsToList (name: _: "${name}=flake:${name}") flakeInputs;
      registry = mapAttrs (_: flake: { inherit flake; }) flakeInputs;

      settings =
        let
          kb = 1024;
          mb = 1024 * kb;
          gb = 1024 * mb;
        in
        {
          auto-optimise-store = true;
          builders-use-substitutes = true;
          connect-timeout = 5;

          experimental-features = [
            "flakes"
            "nix-command"
            "pipe-operators"
          ];

          fallback = true;
          flake-registry = "/etc/nix/registry.json";
          http-connections = 128;
          log-lines = 25;
          max-free = 30 * gb;
          max-jobs = "auto";
          max-substitution-jobs = 128;
          min-free = 5 * gb;

          substituters = [
            "https://cache.nixos.org"
            "https://cosmic.cachix.org"
            "https://helix.cachix.org"
            "https://nix-community.cachix.org"
          ];

          trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
            "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];

          trusted-users = [
            "heitor"
            "root"
          ];

          use-xdg-base-directories = true;
          warn-dirty = false;
        };
    };

  nixpkgs.config.allowUnfree = true;
}
