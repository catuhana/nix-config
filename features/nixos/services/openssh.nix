_: {
  caden.nixos = {
    provides.services = {
      provides.openssh = {
        nixos = _: {
          services.openssh = {
            enable = true;
            startWhenNeeded = true;

            settings = {
              PasswordAuthentication = false;
              PermitRootLogin = "no";
            };
          };
        };
      };
    };
  };
}
