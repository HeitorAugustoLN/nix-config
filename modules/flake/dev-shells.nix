{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.nixos-facter
          pkgs.nodejs
          pkgs.sops
        ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
