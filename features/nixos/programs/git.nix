_: {
  caden.nixos = {
    provides.programs = {
      provides.git = {
        nixos = _: {
          programs.git.enable = true;
        };
      };
    };
  };
}
