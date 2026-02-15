{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.services.scx;
  kind = config.tuhana.system.kind;
in
{
  options.tuhana.services.scx = {
    enable = mkEnableOption "sched_ext" // {
      default = kind == "laptop" || kind == "desktop";
    };
  };

  config = mkIf cfg.enable {
    services.scx = {
      enable = true;
      scheduler = "scx_bpfland";
    };
  };
}
