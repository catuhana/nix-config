{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkEnableOption
    types
    ;

  cfg = config.tuhana.core.environment;
in
{
  options.tuhana.core.environment = {
    msedit = mkEnableOption "Install Microsoft Editor" // {
      default = true;
    };
    git = mkEnableOption "Install Git" // {
      default = true;
    };
  };

  config = mkMerge [
    (mkIf cfg.git {
      environment.systemPackages = [ pkgs.git ];
    })
    (mkIf cfg.msedit {
      environment.systemPackages = [ pkgs.msedit ];

      environment.variables = {
        EDITOR = "edit";
        VISUAL = "edit";
      };
    })
  ];
}
