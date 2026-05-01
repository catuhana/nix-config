{
  __findFile,
  ...
}:
{
  caden.home = {
    provides.gnome = {
      provides.shell = {
        provides.settings = {
          includes = [
            <caden/home/gnome/shell/settings/appearance>
          ];

          provides.appearance =
            { user, ... }:
            {
              homeManager =
                { lib, ... }:
                {
                  dconf.settings =
                    let
                      inherit (user.caden.home.gnome.shell.settings.appearance)
                        accent-colour
                        ;
                    in
                    {
                      "org/gnome/desktop/interface".accent-color = lib.mkIf (accent-colour != null) accent-colour;
                    };
                };
            };
        };
      };
    };
  };
}
