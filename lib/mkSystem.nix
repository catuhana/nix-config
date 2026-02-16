{ inputs }:
{
  hostName,
  system,
  kind,
  extraModules ? [ ],
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit hostName;
  };

  modules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote
  ]
  ++ [ (inputs.self + /hosts/${hostName}) ]
  ++ [ { tuhana.system.kind = kind; } ]
  ++ extraModules;
}
