{ inputs, ... }:
{
  programs.fish = {
    enable = true;

    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
  };

  nixpkgs.overlays = [
    (final: _: { inherit (import inputs.nixpkgs-fish4 { inherit (final) system; }) fish; })
  ];
}
