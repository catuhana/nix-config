{
  caden.time = {
    nixos = {
      networking.timeServers = [
        "time.cloudflare.com"
        "pool.ntp.org"
      ];
    };

    provides.Istanbul.nixos = {
      time.timeZone = "Europe/Istanbul";
    };
  };
}
