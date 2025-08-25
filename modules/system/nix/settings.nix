{ inputs, lib, ... }:
{
  unify.modules.nix-settings.nixos = {
    # https://github.com/NixOS/nixpkgs/blob/41cae5beb603cdb8d05f880c1b606cf2c7e6b383/nixos/modules/programs/environment.nix#L18
    environment.variables.NIXPKGS_CONFIG = lib.mkForce "";

    nix = {
      channel.enable = false;
      daemonCPUSchedPolicy = "batch";
      daemonIOSchedClass = "idle";
      daemonIOSchedPriority = 7;
      nixPath = inputs |> lib.mapAttrsToList (name: _: "${name}=flake:${name}");
      registry = inputs |> builtins.mapAttrs (_: flake: { inherit flake; });

      settings =
        let
          kb = 1000;
          mb = 1000 * kb;
          gb = 1000 * kb;
        in
        {
          allow-import-from-derivation = false;
          auto-optimise-store = true;
          builders-use-substitutes = true;
          connect-timeout = 5;

          experimental-features = [
            "flakes"
            "nix-command"
            "pipe-operators"
          ];

          extra-substituters = [ "https://nix-community.cachix.org" ];

          extra-trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];

          fallback = true;
          flake-registry = "/etc/nix/registry.json";
          max-free = 1 * gb;
          max-jobs = "auto";
          min-free = 128 * mb;

          trusted-users = [
            "root"
            "@wheel"
          ];

          use-xdg-base-directories = true;
          warn-dirty = false;
        };
    };
  };
}
