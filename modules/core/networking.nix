{ ... }:
{
  networking = {
    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];

    timeServers = [ "time.cloudflare.com" ];
  };

  services.resolved = {
    enable = true;

    dnssec = "true";
    dnsovertls = "true";

    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
    ];
  };
}
