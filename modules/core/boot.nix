{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };

      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    initrd = {
      systemd = {
        enable = true;
        dmVerity.enable = true;
      };

      nix-store-veritysetup.enable = true;
    };

    tmp.cleanOnBoot = true;
  };
}
