{
  description = "Minimal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko/?ref=v1.12.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, disko, ... }@inputs:
    {
      nixosConfigurations.MateBookD14 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        modules = [
          ./audio.nix
          ./boot.nix
          ./disks.nix
          ./environment.nix
          ./fonts.nix
          ./gnome.nix
          ./hardware.nix
          ./locale.nix
          ./networking.nix
          ./nix.nix
          ./programs.nix
          ./security.nix
          ./services.nix
          ./swap.nix
          ./systemd.nix
          ./users.nix
          {
            system.stateVersion = "26.05";
          }
        ];
      };
    };
}
