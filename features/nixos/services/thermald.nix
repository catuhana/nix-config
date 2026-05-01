_: {
  caden.nixos = {
    provides.services = {
      provides.thermald = {
        nixos = _: {
          services.thermald = {
            enable = true;
          };
        };
      };
    };
  };
}
