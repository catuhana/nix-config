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
    mkOption
    mkEnableOption
    types
    strings
    ;

  cfg = config.tuhana.desktop.gnome;

  hostGnomeEnabled = osConfig.tuhana.desktop.gnome.enable or false;
in
{
  options.tuhana.desktop.gnome = {
    enable = mkEnableOption "GNOME" // {
      default = hostGnomeEnabled;
    };

    wallpaper = mkOption {
      type = types.nullOr (
        types.oneOf [
          types.path
          types.package
          types.url
        ]
      );
      default = null;
    };
  };

  config = mkIf cfg.enable {
    programs.gnome-shell = {
      enable = true;

      extensions = with pkgs.gnomeExtensions; [
        { package = blur-my-shell; }
        { package = caffeine; }
        { package = appindicator; }
        { package = just-perfection; }
        { package = unite; }
      ];
    };

    dconf.settings = {
      "org/gnome/desktop/background" =
        let
          toFileURI =
            path:
            let
              str =
                if builtins.isString path then
                  builtins.replaceStrings [ "%2F" ] [ "/" ] (strings.escapeURL path)
                else
                  path;
            in
            "file://${str}";
        in
        mkIf (cfg.wallpaper != null) {
          picture-uri = toFileURI cfg.wallpaper;
          picture-uri-dark = toFileURI cfg.wallpaper;
        };
    };
  };
}
