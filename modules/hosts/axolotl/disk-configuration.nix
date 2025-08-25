{
  unify.hosts.nixos.axolotl.nixos.disko.devices.disk = {
    ssd = {
      type = "disk";
      device = "/dev/sda";

      content = {
        type = "gpt";

        partitions = {
          boot = {
            size = "1G";
            type = "EF00";
            priority = 1;

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
            };
          };

          root = {
            size = "100%";

            content = {
              type = "luks";
              name = "root";
              settings.allowDiscards = true;

              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];

                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "/var" = {
                    mountpoint = "/var";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "/tmp" = {
                    mountpoint = "/tmp";
                    mountOptions = [ "compress=zstd" ];
                  };
                };
              };
            };
          };
        };
      };
    };

    hdd = {
      type = "disk";
      device = "/dev/sdb";

      content = {
        type = "gpt";

        partitions.home = {
          size = "100%";

          content = {
            type = "luks";
            name = "home";
            settings.allowDiscards = true;

            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];

              subvolumes = {
                "/home" = {
                  mountpoint = "/home";
                  mountOptions = [ "compress=zstd" ];
                };
              };
            };
          };
        };
      };
    };
  };
}
