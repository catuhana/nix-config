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
    ;

  cfg = config.tuhana.core.environment;
in
{
  options.tuhana.core.environment = {
    msedit = mkEnableOption "Microsoft Editor" // {
      default = true;
    };
    git = mkEnableOption "Git" // {
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
