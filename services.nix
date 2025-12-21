{ ... }:
{
  services = {
    homed.enable = true;
    # Rebuils get stuck on restarting services
    # when enabled. Disable for now.
    # resolved.enable = true;
    userdbd.silenceHighSystemUsers = true;
  };
}
