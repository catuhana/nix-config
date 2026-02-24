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

  cfg = config.tuhana.desktop.audio;
  desktopEnabled = config.tuhana.desktop.enable;
in
{
  options.tuhana.desktop.audio = {
    enable = mkEnableOption "audio" // {
      default = desktopEnabled;
    };
  };

  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;

      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };
  };
}
