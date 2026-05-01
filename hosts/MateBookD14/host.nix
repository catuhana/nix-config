{
  __findFile,
  ...
}:
{
  den.hosts = {
    x86_64-linux = {
      MateBookD14 = { };
    };
  };

  den.aspects = {
    MateBookD14 = {
      includes = [
        <caden/nixos/core/audio>

        # I think secure boot and whatnot (and others too) should also be
        # schema-ised just like the GNOME one. Investigate.
        <caden/nixos/core/boot>
        <caden/nixos/core/boot/secure-boot>
        <caden/nixos/core/boot/silent-boot>
        <caden/nixos/core/boot/plymouth>

        <caden/nixos/core/locale>
        <caden/nixos/core/locale/tr_TR>

        <caden/nixos/core/networking>
        <caden/nixos/core/networking/resolved>
        <caden/nixos/core/networking/resolved/mdns>
        <caden/nixos/core/networking/dns/cloudflare>

        <caden/nixos/core/security/apparmor>
        <caden/nixos/core/security/tpm2>

        <caden/nixos/gnome>

        <caden/nixos/programs/msedit>

        <caden/nixos/services/flatpak>
        <caden/nixos/services/openssh>
        <caden/nixos/services/scx>
        <caden/nixos/services/thermald>
        <caden/nixos/services/usbmuxd>
      ];
    };
  };
}
