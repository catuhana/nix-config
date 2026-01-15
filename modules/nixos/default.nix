{ ... }:
{
  imports = [
    ./core/boot.nix
    ./core/environment.nix
    ./core/locale.nix
    ./core/networking.nix
    ./core/nix.nix
    ./core/security.nix
    ./core/swap.nix

    ./desktop/audio.nix
    ./desktop/flatpak.nix
    ./desktop/gnome.nix

    ./programs/nix-ld.nix

    ./services/userborn.nix
  ];
}
