{ inputs, ... }:
{
  unify.modules."heitor.neovim".home =
    { pkgs, ... }:
    {
      home.packages = [ inputs.neovim.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
}
