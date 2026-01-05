{ ... }:
{
  networking = {
    hostName = "MateBookD14";

    # Causes hangs on rebuilds, disable for now.
    # useNetworkd = true;

    wireless.enable = false;
  };
}
