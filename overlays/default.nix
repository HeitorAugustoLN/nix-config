{ inputs, ... }:
{
  flake.overlays = {
    # My custom packages
    additions = final: _prev: import ../pkgs/all-packages.nix { pkgs = final; };

    modifications = _final: _prev: { };

    # Acessible through 'pkgs.stable'
    stable-packages = final: _prev: {
      stable = import inputs.nixpkgs-stable {
        inherit (final) system;
        config.allowUnfree = true;
      };
    };
  };
}
