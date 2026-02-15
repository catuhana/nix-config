{ ... }:
{
  imports = [
    ./configuration.nix
    ./disks.nix

    ../../modules/nixos

    ../../users/tuhana.nix
  ];
}
