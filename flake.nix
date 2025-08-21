{
  description = "HeitorAugustoLN's personal Nix configuration flake";

  inputs = { };

  outputs =
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } { systems = [ "x86_64-linux" ]; };
}
