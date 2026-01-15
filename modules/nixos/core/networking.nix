{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkEnableOption
    types
    ;

  cfg = config.tuhana.core.networking;
in
{
  options.tuhana.core.networking = {
    resolved.enable = mkEnableOption "Use systemd-resolved for DNS";
  };

  config = mkMerge [
    {
      networking = {
        timeServers = [ "time.cloudflare.com" ];
      };
    }
    (mkIf cfg.resolved.enable {
      services.resolved = {
        enable = true;

        dnssec = "true";
        dnsovertls = "true";

        domains = [ "~." ];
        fallbackDns = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    })
  ];
}
