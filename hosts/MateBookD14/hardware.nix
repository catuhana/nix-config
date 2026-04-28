_: {
  den.aspects = {
    MateBookD14 = {
      nixos =
        { pkgs, ... }:
        {
          boot = {
            kernelPackages = pkgs.linuxPackages_xanmod_latest;

            kernelParams = [
              "xe.force_probe=46a6"
              "i915.force_probe=!46a6"
            ];
          };

          hardware = {
            enableAllFirmware = true;
            cpu.intel.updateMicrocode = true;
            graphics.extraPackages = [ pkgs.intel-media-driver ];
          };
        };
    };
  };
}
