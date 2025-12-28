{ pkgs, ... }:
{
  services = {
    fwupd.enable = true;
    thermald.enable = true;
  };

  hardware = {
    enableAllFirmware = true;

    ksm.enable = true;
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable32Bit = true;

      extraPackages = [ pkgs.intel-media-driver ];
      extraPackages32 = [ pkgs.pkgsi686Linux.intel-media-driver ];
    };
  };
}
