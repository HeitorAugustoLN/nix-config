{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          just
          nixos-facter
          sops
        ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
