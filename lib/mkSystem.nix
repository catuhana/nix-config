{ inputs }:
{
  hostName,
  system,
  kind,
  modules ? [ ],
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit hostName inputs;
  };

  modules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote

    { tuhana.system.kind = kind; }
  ]
  ++ modules;
}
