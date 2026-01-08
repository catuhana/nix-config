{ pkgs, ... }:
{
  boot = {
    # TODO: Maybe drop this, let the kernel
    # decide which one to load?
    kernelParams = [
      # Force load the Xe driver
      "i915.force_probe=!46a6"
      "xe.force_probe=46a6"
      # Silent boot
      "quiet"
      "udev.log_level=3"
    ];

    consoleLogLevel = 0;
    initrd.verbose = false;

    plymouth.enable = true;
  };
}
