_: {
  caden.nixos = {
    provides.services = {
      provides.flatpak = {
        nixos = _: {
          services.flatpak.enable = true;
        };
      };
    };
  };
}
