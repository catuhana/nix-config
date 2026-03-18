{
  __findFile ? __findFile,
  ...
}:
{
  caden.gnome.provides.settings = {
    includes = [
      <caden/gnome/settings/accent-colour/purple>
      <caden/gnome/settings/wallpapers/and-the-circus-leaves-town>
    ];

    provides.wallpapers.provides.and-the-circus-leaves-town.homeManager =
      { pkgs, ... }:
      {
        dconf.settings."org/gnome/desktop/background" =
          let
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

    provides.accent-colour._.purple.homeManager.dconf.settings."org/gnome/desktop/interface".accent-color =
      "purple";
  };
}
