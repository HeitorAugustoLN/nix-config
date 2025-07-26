{
  description = "HeitorAugustoLN's personal Nix configuration flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } { systems = [ "x86_64-linux" ]; };
}
