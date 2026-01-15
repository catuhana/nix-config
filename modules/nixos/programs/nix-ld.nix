{ config, lib, ... }:
let
  inherit (lib)
    mkEnableOption
    ;

  cfg = config.tuhana.programs.nix-ld;
in
{
  options.tuhana.programs.nix-ld = {
    enable = mkEnableOption "Enable nix-ld";
  };

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;
  };
}
