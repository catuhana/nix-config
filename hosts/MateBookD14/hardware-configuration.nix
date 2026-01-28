{ pkgs, ... }:
{
  services.fwupd.enable = true;

  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics.extraPackages = [ pkgs.intel-media-driver ];
  };
}
