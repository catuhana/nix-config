{ config, lib, ... }:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.programs.git;
in
{
  options.tuhana.programs.git = {
    enable = mkEnableOption "Git" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.git.enable = true;
  };
}
