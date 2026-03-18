{
  caden.services.provides.openssh.nixos = {
    services.openssh = {
      enable = true;
      startWhenNeeded = true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
