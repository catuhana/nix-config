{ config, lib, ... }:
let
  inherit (lib)
    mkEnableOption
    ;

  cfg = config.tuhana.services.userborn;
in
{
  options.tuhana.services.userborn = {
    enable = mkEnableOption "Enable Userborn";
  };

  config = lib.mkIf cfg.enable {
    services.userborn.enable = true;
  };
}
