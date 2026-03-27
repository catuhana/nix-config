{
  __findFile,
  ...
}:
{
  caden.gnome = {
    provides.shell = {
      provides.settings = {
        includes = [
          <caden/gnome/shell/settings/appearance/accent-colour/purple>
          <caden/gnome/shell/settings/appearance/wallpaper/and-the-circus-leaves-town>
        ];

        provides.appearance = {
          provides.accent-colour = {
            provides.purple = {
              homeManager = _: {
                dconf.settings."org/gnome/desktop/interface" = {
                  accent-color = "purple";
                };
              };
            };
          };

          provides.wallpaper = {
            provides.and-the-circus-leaves-town = {
              homeManager =
                { pkgs, ... }:
                {
                  dconf.settings."org/gnome/desktop/background" =
                    let
                      # TODO: Refactor out to a meta-package like `tuhana-wallpapers` or something.
                      and-the-circus-leaves-town = pkgs.runCommand "and-the-circus-leaves-town" {
                        src = pkgs.fetchurl {
                          url = "https://coverartarchive.org/release/fafca640-a7f6-49bc-92d1-2d0754662b47/front";
                          hash = "sha256-6LBrAoVAtugrrfwao2nQfMApPVo/HiQBQxLfJchMX+U=";
                          curlOptsList = [ "-L" ];
                        };
                        nativeBuildInputs = [ pkgs.libjpeg_turbo ];
                      } "jpegtran -crop 1200x750+0+198 -copy none $src >$out";
                    in
                    {
                      picture-uri = "file://${and-the-circus-leaves-town}";
                      picture-uri-dark = "file://${and-the-circus-leaves-town}";
                    };
                };
            };
          };
        };
      };
    };
  };
}
