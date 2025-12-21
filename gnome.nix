{ pkgs, ... }:
let
  nixos-background-info = pkgs.stdenv.mkDerivation { name = "nixos-background-info"; };
in
{
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;

    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    };

    flatpak.enable = true;
  };

  environment.gnome.excludePackages = [ nixos-background-info ];
}
