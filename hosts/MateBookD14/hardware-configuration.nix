{ pkgs, ... }:
{
  services.fwupd.enable = true;

  hardware = {
    ksm.enable = true;
    cpu.intel.updateMicrocode = true;

    graphics.extraPackages = [ pkgs.intel-media-driver ];
  };
}
