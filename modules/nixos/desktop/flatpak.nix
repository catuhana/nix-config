{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.desktop.flatpak;
  desktopEnabled = config.tuhana.desktop.enable;
in
{
  options.tuhana.desktop.flatpak = {
    enable = mkEnableOption "Flatpak" // {
      default = desktopEnabled;
    };
  };

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
    # TODO: Later might need to enable `fonts.fontsDir`
    # and configure if needed.
  };
}
