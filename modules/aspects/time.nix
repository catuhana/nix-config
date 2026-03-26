_: {
  caden.time = {
    nixos = _: {
      # TODO: Move this to `networking` aspect?
      networking.timeServers = [
        "time.cloudflare.com"
        "pool.ntp.org"
      ];
    };

    provides.Istanbul = {
      os = _: {
        time.timeZone = "Europe/Istanbul";
      };
    };
  };
}
