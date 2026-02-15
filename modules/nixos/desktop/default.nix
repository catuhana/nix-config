{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    ;

  kind = config.tuhana.system.kind;
  cfg = config.tuhana.desktop;

  anyDEEnabled = cfg.gnome.enable;
in
{
  imports = [
    ./audio.nix
    ./flatpak.nix
    ./gnome.nix
  ];

  options.tuhana.desktop = {
    enable = mkEnableOption "desktop environment" // {
      default = kind == "laptop" || kind == "desktop";
    };
  };

  config = {
    assertions = [
      {
        assertion = cfg.enable -> anyDEEnabled;
        message = "tuhana.desktop.enable is true but no desktop environment is enabled.";
      }
    ];
  };
}
