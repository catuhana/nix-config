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

  # TODO: Maybe auto-import `hosts/${hostName}.nix` if it exists?
  modules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.default
    inputs.lanzaboote.nixosModules.lanzaboote

    { tuhana.system.kind = kind; }
  ]
  ++ modules;
}
