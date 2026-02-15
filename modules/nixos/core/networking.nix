{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    mkMerge
    mkEnableOption
    ;

  cfg = config.tuhana.core.networking;

  DNS = {
    ips = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    dot = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
      "2606:4700:4700::1111#cloudflare-dns.com"
      "2606:4700:4700::1001#cloudflare-dns.com"
    ];
  };
in
{
  options.tuhana.core.networking = {
    useCustomDNS = mkEnableOption "custom DNS servers" // {
      default = true;
    };

    resolved = {
      enable = mkEnableOption "systemd-resolved for DNS" // {
        default = true;
      };

      mDNS = mkEnableOption "Multicast DNS";
    };
  };

  config = mkMerge [
    {
      networking = {
        timeServers = [ "time.cloudflare.com" ];
      };
    }
    # FIXME: Should only be applied when
    # environment is not `server`.
    (mkIf cfg.useCustomDNS {
      networking.nameservers = DNS.ips;
      programs.captive-browser = {
        enable = true;
        interface = "wlp0s20f3";
      };
    })
    (mkIf cfg.resolved.enable {
      services.resolved = {
        enable = true;

        settings.Resolve = {
          Domains = [ "~." ];

          DNSOverTLS = true;
          DNSSEC = true;
          MulticastDNS = cfg.resolved.mDNS;
          LLMNR = false;

          FallbackDNS = mkIf cfg.useCustomDNS DNS.dot;
        };
      };
    })
  ];
}
