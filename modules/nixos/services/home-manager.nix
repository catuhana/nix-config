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

  cfg = config.tuhana.services.home-manager;
in
{
  options.tuhana.services.home-manager = {
    enable = mkEnableOption "Home Manager" // {
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      backupFileExtension = "bak";
    };
  };
}
