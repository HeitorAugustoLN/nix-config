{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  umu-run = pkgs.callPackage ./umu-launcher/umu-run.nix { };
in
{
  hydralauncher = pkgs.callPackage ./hydralauncher { };
  vinegar = pkgs.callPackage ./vinegar { };
  umu-launcher = pkgs.callPackage ./umu-launcher {
    inherit umu-run;
    umu-run-fhs = pkgs.callPackage ./umu-launcher/umu-run-fhs.nix { inherit umu-run; };
  };
}
