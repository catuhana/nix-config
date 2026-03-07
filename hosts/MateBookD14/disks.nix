{ ... }:
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/nvme0n1";
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            esp = {
              name = "boot";
              type = "EF00";
              size = "1G";

              content = {
                type = "filesystem";
                format = "vfat";

                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            luks = {
              name = "luks";
              size = "100%";

              content = {
                name = "cryptroot";
                type = "luks";

                settings = {
                  bypassWorkqueues = true;
                  crypttabExtraOpts = [ "tpm2-device=auto" ];
                };

                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];

                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };

                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };

                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                      ];
                    };

                    "@swap" = {
                      mountpoint = "/swap";
                      swap = {
                        swapfile.size = "16G";
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
