{
  perSystem =
    { pkgs, ... }:
    {
      packages = import ./all-packages.nix { inherit pkgs; };
    };
}
