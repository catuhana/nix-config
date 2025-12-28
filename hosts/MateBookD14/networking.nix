{ ... }:
{
  networking = {
    hostName = "MateBookD14";

    # Causes hangs on rebuilds, disable for now.
    # useNetworkd = true;
    wireless.iwd.enable = true;
  };
}
