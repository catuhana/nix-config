_: {
  den.aspects = {
    MateBookD14 = {
      nixos =
        { pkgs, ... }:
        {
          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
          };

          boot.kernelParams = [
            "xe.force_probe=46a6"
            "i915.force_probe=!46a6"
          ];
        };
    };
  };
}
