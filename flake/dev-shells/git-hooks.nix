{ inputs, ... }:
{
  imports = [ inputs.git-hooks.flakeModule ];

  perSystem.pre-commit.settings.hooks = {
    actionlint.enable = true;
    editorconfig-checker.enable = true;
    treefmt.enable = true;

    yamllint = {
      enable = true;

      settings = {
        configPath = "${../../.yamllint.yaml}";
        strict = false;
      };
    };
  };
}
