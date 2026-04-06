{
  __findFile,
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
          <caden/gnome/shell/extensions/copyous>
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

        provides.copyous = {
          homeManager =
            { pkgs, ... }:
            {
              programs.gnome-shell.extensions = [
                {
                  package = pkgs.gnomeExtensions.copyous.overrideAttrs (old: {
                    buildInputs = [ pkgs.libgda5 ];

                    preInstall = ''
                      sed -i "1i import GIRepository from 'gi://GIRepository';\nGIRepository.Repository.dup_default().prepend_search_path('${pkgs.libgda5}/lib/girepository-1.0');\nGIRepository.Repository.dup_default().prepend_search_path('${pkgs.gsound}/lib/girepository-1.0');\n" lib/preferences/dependencies/dependencies.js
                      sed -i "1i import GIRepository from 'gi://GIRepository';\nGIRepository.Repository.dup_default().prepend_search_path('${pkgs.libgda5}/lib/girepository-1.0');\n" lib/misc/db.js
                    '';
                  });
                }
              ];
            };
        };
      };
    };
  };
}
