{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.services.scx;
in
{
  options.tuhana.services.scx = {
    enable = mkEnableOption "sched_ext";
  };

  config = mkIf cfg.enable {
    services.scx = {
      enable = true;
      scheduler = "scx_bpfland";
    };
  };
}
