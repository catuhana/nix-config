{
  inputs,
  __findFile,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = {
        users.tuhana = { };
      };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        <caden/core/audio>

        # I think secure boot and whatnot (and others too) should also be
        # schema-ised just like the GNOME one. Investigate.
        <caden/core/boot>
        <caden/core/boot/secure-boot>
        <caden/core/boot/silent-boot>
        <caden/core/boot/plymouth>

        <caden/core/locale>
        <caden/core/locale/tr_TR>

        <caden/core/networking>
        <caden/core/networking/resolved>
        <caden/core/networking/resolved/mdns>
        <caden/core/networking/dns/cloudflare>

        <caden/core/security/apparmor>
        <caden/core/security/tpm2>

        <caden/gnome>

        <caden/programs/git>
        <caden/programs/msedit>

        <caden/services/flatpak>
        <caden/services/openssh>
        <caden/services/scx>
        <caden/services/thermald>
        <caden/services/usbmuxd>
      ];

      nixos =
        { pkgs, ... }:
        {
          imports = [ inputs.disko.nixosModules.default ];

          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
          };

          boot.kernelParams = [
            "xe.force_probe=46a6"
            "i915.force_probe=!46a6"
          ];

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
                          allowDiscards = true;
                          bypassWorkqueues = true;
                          crypttabExtraOpts = [ "tpm2-device=auto" ];
                        };

                        content = {
                          type = "lvm_pv";
                          vg = "system";
                        };
                      };
                    };
                  };
                };
              };
            };

            lvm_vg = {
              system = {
                type = "lvm_vg";

                lvs = {
                  swap = {
                    size = "20G";
                    content = {
                      type = "swap";
                      resumeDevice = true;
                    };
                  };

                  root = {
                    size = "100%";
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
                        "@home" = {
                          mountpoint = "/home";
                          mountOptions = [
                            "compress=zstd"
                            "noatime"
                          ];
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
