{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkOption
    types
    ;

  cfg = config.tuhana.core.locale;
in
{
  options.tuhana.core.locale = {
    timeZone = mkOption {
      type = types.str;
    };

    defaultLocale = mkOption {
      type = types.str;
      default = "en_GB.UTF-8";
    };
  };

  config = {
    time.timeZone = cfg.timeZone;

    i18n = {
      inherit (cfg) defaultLocale;

      extraLocales = [
        "tr_TR.UTF-8/UTF-8"
        "en_US.UTF-8/UTF-8"
      ];
    };
  };
}
