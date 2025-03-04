{
  perSystem =
    {
      config,
      pkgs,
      self',
      ...
    }:
    {
      devShells = {
        default = self'.devShells.configure;

        configure = pkgs.mkShell {
          packages = with pkgs; [
            git
            sops
            ssh-to-age
          ];

          shellHook = config.pre-commit.installationScript;
          strictDeps = true;
        };
      };
    };
}
