{ inputs, ... }:
{
  flake.overlays = {
    # My custom packages
    additions = final: _prev: import ../pkgs/all-packages.nix { pkgs = final; };

    modifications = final: prev: {
      application-title-bar = prev.application-title-bar.overrideAttrs (
        finalAttrs: oldAttrs: {
          version = "0.7.3";
          src = prev.fetchFromGitHub {
            owner = oldAttrs.src.owner;
            repo = oldAttrs.src.repo;
            rev = oldAttrs.src.rev;
            hash = "sha256-kvFUz0m222jTGrkqLyYmnW0o4MXU9lLAsyk6QBAJHr8=";
          };
        }
      );
    };

    # Acessible through 'pkgs.stable'
    stable-packages = final: _prev: {
      stable = import inputs.nixpkgs-stable {
        system = final.system;
        config.allowUnfree = true;
      };
    };
  };
}
