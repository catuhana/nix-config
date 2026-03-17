{
  caden.services = {
    provides.flatpak.nixos = {
      services.flatpak.enable = true;
    };

    provides.openssh.nixos = {
      services.openssh = {
        enable = true;
        startWhenNeeded = true;

        settings = {
          PasswordAuthentication = false;
          PermitRootLogin = "no";
        };
      };
    };

    provides.scx.nixos = {
      services.scx = {
        enable = true;
        # Figure out a way to configure this on different hosts.
        scheduler = "scx_lavd";
      };
    };
  };
}
