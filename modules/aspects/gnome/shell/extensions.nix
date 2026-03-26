{
  __findFile ? __findFile,
  ...
}:
{
  # TODO: Refactor for DRY.
  caden.gnome = {
    provides.shell = {
      provides.extensions = {
        includes = [
          <caden/gnome/shell/extensions/blur-my-shell>
          <caden/gnome/shell/extensions/caffeine>
          <caden/gnome/shell/extensions/appindicator>
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
    };
  };
}
