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
          nativeBuildInputs = with pkgs; [
            age
            git
            nix
            ssh-to-age
            sops
          ];

          shellHook = config.pre-commit.installationScript;

          strictDeps = true;
        };
      };
    };
}
