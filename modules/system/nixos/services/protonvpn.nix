{
  unify.modules.protonvpn = {
    home =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.protonvpn-gui ];
      };

    nixos.networking.firewall.checkReversePath = "loose";
  };
}
