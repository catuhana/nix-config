{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.core.swap;
in
{
  options.tuhana.core.swap = {
    enable = mkEnableOption "ZRAM swap" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    zramSwap.enable = true;
  };
}
