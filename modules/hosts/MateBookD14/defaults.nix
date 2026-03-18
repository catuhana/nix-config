{
  __findFile ? __findFile,
  ...
}:
{
  den.hosts.x86_64-linux.MateBookD14 = {
    users.tuhana = { };
  };

  den.aspects.MateBookD14 = {
    nixos =
      { pkgs, ... }:
      {
        services.fwupd.enable = true;

        hardware = {
          enableAllFirmware = true;
          cpu.intel.updateMicrocode = true;
          graphics.extraPackages = [ pkgs.intel-media-driver ];
        };

        boot.kernelParams = [
          "xe.force_probe=46a6"
          "i915.force_probe=!46a6"
        ];

        system.stateVersion = "26.05";
      };

    includes = [
      <caden/audio>

      <caden/boot>
      <caden/boot/secure-boot>
      <caden/boot/silent-boot>
      <caden/boot/plymouth>

      <caden/gnome>

      <caden/locale/tr_TR>
      <caden/locale/en_GB>

      <caden/networking>
      <caden/networking/resolved>
      <caden/networking/resolved/mdns>
      <caden/networking/dns/cloudflare>

      <caden/programs/git>
      <caden/programs/msedit>

      <caden/security/apparmor>
      <caden/security/tpm2>

      <caden/services/flatpak>
      <caden/services/openssh>
      <caden/services/scx>

      <caden/time>
      <caden/time/Istanbul>
    ];
  };
}
