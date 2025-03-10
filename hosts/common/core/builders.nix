{ config, lib, ... }:
let
  inherit (lib) recursiveUpdate singleton;
in
{
  nix = {
    buildMachines =
      let
        common = {
          protocol = "ssh-ng";
          sshKey = "${config.users.users.heitor.home}/.ssh/id-ed25519";
          sshUser = "heitor";
        };
      in
      map (builder: recursiveUpdate common builder) [
        {
          hostName = "build-box.nix-community.org";
          maxJobs = 8;
          publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUVsSVE1NHFBeTdEaDYzckJ1ZFlLZGJ6SkhycmJyck1YTFlsN1BrbWs4OEgK";

          supportedFeatures = [
            "benchmark"
            "big-parallel"
            "kvm"
            "nixos-test"
          ];

          systems = [
            "i686-linux"
            "riscv64-linux"
            "x86_64-linux"
          ];
        }
        {
          hostName = "aarch64-build-box.nix-community.org";
          maxJobs = 16;
          publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUc5dXlmaHlsaStCUnRrNjR5K25pcXRiK3NLcXVSR0daODdmNFlSYzhFRTEK";

          supportedFeatures = [
            "benchmark"
            "big-parallel"
            "kvm"
            "nixos-test"
          ];

          systems = [
            "aarch64-linux"
            "armv7l-linux"
          ];
        }
        {
          hostName = "darwin-build-box.nix-community.org";
          maxJobs = 4;
          publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUtNSGhsY243ZlVwVXVpT0ZlSWhEcUJ6Qk5Gc2JOcXErTnB6dUdYM2U2enYgCg==";
          supportedFeatures = singleton "big-parallel";

          systems = [
            "aarch64-darwin"
            "x86_64-darwin"
          ];
        }
      ];

    distributedBuilds = true;
  };
}
