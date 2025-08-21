{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = [ pkgs.sops ];
        shellHook = config.pre-commit.installationScript;
      };
    };
}
