{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.desktop.gnome;

  hostGnomeEnabled = osConfig.tuhana.desktop.gnome.enable or false;
in
{
  options.tuhana.desktop.gnome = {
    enable = mkEnableOption "GNOME" // {
      default = hostGnomeEnabled;
    };
  };

  config = mkIf cfg.enable {
    programs.gnome-shell = {
      enable = true;

      extensions = with pkgs.gnomeExtensions; [
        {
          package = blur-my-shell;
        }
        {
          package = caffeine;
        }
        {
          package = appindicator;
        }
        {
          package = gsconnect;
        }
      ];
    };
  };
}
