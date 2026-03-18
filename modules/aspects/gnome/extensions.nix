{
  __findFile ? __findFile,
  ...
}:
{
  caden.gnome.provides.extensions = {
    homeManager.programs.gnome-shell.enable = true;

    includes = [
      <caden/gnome/extensions/blur-my-shell>
      <caden/gnome/extensions/caffeine>
      <caden/gnome/extensions/appindicator>
    ];

    provides.blur-my-shell = {
      homeManager =
        { pkgs, ... }:
        {
          programs.gnome-shell.extensions = [
            { package = pkgs.gnomeExtensions.blur-my-shell; }
          ];
        };
    };

    provides.caffeine = {
      homeManager =
        { pkgs, ... }:
        {
          programs.gnome-shell.extensions = [
            { package = pkgs.gnomeExtensions.caffeine; }
          ];
        };
    };

    provides.appindicator = {
      homeManager =
        { pkgs, ... }:
        {
          programs.gnome-shell.extensions = [
            { package = pkgs.gnomeExtensions.appindicator; }
          ];
        };
    };
  };
}
