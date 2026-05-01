_: {
  caden.home = {
    provides.gnome = {
      provides.shell = {
        homeManager = _: {
          programs.gnome-shell.enable = true;
        };
      };
    };
  };
}
