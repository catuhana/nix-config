{
  config,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.programs.gh;
  homeGitEnabled = config.tuhana.programs.git.enable or false;
in
{
  options.tuhana.programs.gh = {
    enable = mkEnableOption "GitHub CLI" // {
      default = homeGitEnabled;
    };
  };

  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}
