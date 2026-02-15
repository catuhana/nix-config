{ ... }:
{
  imports = [
    ./core/boot.nix
    ./core/environment.nix
    ./core/system.nix
    ./core/home-manager.nix
    ./core/locale.nix
    ./core/networking.nix
    ./core/nix.nix
    ./core/security.nix
    ./core/swap.nix

    ./desktop

    ./programs/nix-ld.nix

    ./services/scx.nix
    ./services/userborn.nix
  ];
}
