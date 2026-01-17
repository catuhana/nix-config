{ pkgs, ... }:
{
  services.fwupd.enable = true;

  hardware = {
    enableAllFirmware = true;

    ksm.enable = true;
    cpu.intel.updateMicrocode = true;

    graphics.extraPackages = [ pkgs.intel-media-driver ];
  };
}
