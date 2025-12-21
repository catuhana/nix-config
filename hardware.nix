{ pkgs, ... }:
let
  intelPackages =
    ps: with ps; [
      intel-media-driver
      intel-vaapi-driver
    ];
in
{
  services.fwupd.enable = true;

  hardware = {
    enableAllFirmware = true;

    ksm.enable = true;
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable32Bit = true;

      extraPackages = intelPackages pkgs;
      extraPackages32 = intelPackages pkgs.pkgsi686Linux;
    };
  };
}
