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
    enable = mkEnableOption "Git version control system" // {
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
          signingkey = "~/.ssh/id_ed25519.pub";
        };
      };

      signing = {
        signByDefault = true;
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
      };
    };
  };
}
