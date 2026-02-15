{
  description = "Tuhana's Nix configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      systems,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nixd
            ];
          };

          formatter = pkgs.nixfmt-tree;
        };

      flake = {
        nixosConfigurations = {
          MateBookD14 = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            specialArgs = {
              hostName = "MateBookD14";
              inherit inputs;
            };

            modules = [
              inputs.home-manager.nixosModules.home-manager
              inputs.disko.nixosModules.default
              inputs.lanzaboote.nixosModules.lanzaboote
            ]
            ++ [
              ./hosts/MateBookD14
            ];
          };
        };
      };
    };
}
