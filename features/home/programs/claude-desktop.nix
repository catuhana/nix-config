_: {
  caden.home = {
    provides.programs = {
      provides.claude-desktop = {
        homeManager =
          { pkgs, ... }:
          {
            home.packages = [ pkgs.claude-desktop-fhs ];
          };
      };
    };
  };
}
