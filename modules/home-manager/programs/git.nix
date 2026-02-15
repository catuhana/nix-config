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
    programs.git = {
      enable = true;

      settings = {
        init = {
          defaultBranch = "main";
        };

        user = {
          name = "tuhana";
          email = "tuhana.cat+git@gmail.com";
        };
      };

      signing = {
        signByDefault = true;
        format = "ssh";
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      };
    };
  };
}
