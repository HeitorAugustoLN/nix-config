{ inputs, ... }:
{
  flake.overlays = {
    # My custom packages
    additions = final: _prev: import ../pkgs/all-packages.nix { pkgs = final; };

    modifications = final: prev: {
      kara = prev.kara.overrideAttrs (
        finalAttrs: oldAttrs: {
          version = "unstable";
          src = prev.fetchFromGitHub {
            inherit (oldAttrs.src) owner repo;
            rev = "main";
            hash = "sha256-/sTroJn15blPUOW5/2nlcnz0lApqAUpnNuJK6EWQl0A=";
          };
        }
      );
      plasmusic-toolbar = prev.plasmusic-toolbar.overrideAttrs (
        finalAttrs: oldAttrs: {
          version = "2.0.0";
          src = prev.fetchFromGitHub {
            inherit (oldAttrs.src) owner repo rev;
            hash = "sha256-geT3QfZi0jNHxRcsGavcj5fnlPms1QgMgM4nAf/d2UI=";
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
