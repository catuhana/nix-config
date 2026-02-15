{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.programs.msedit;
in
{
  options.tuhana.programs.msedit = {
    enable = mkEnableOption "msedit" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.msedit ];

    environment.variables = {
      EDITOR = "edit";
      VISUAL = "edit";
    };
  };
}
