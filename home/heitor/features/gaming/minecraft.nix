{ pkgs, ... }:
{
  home.packages = [
    (pkgs.prismlauncher.override {
      jdks = with pkgs; [
        temurin-jre-bin-21
        temurin-jre-bin-17
        temurin-jre-bin-8
      ];
    })
  ];
}
