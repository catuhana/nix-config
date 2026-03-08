{
  runCommand,
  fetchurl,
  libjpeg_turbo,
}:
runCommand "and-the-circus-leaves-town.jpg"
  {
    src = fetchurl {
      url = "https://coverartarchive.org/release/fafca640-a7f6-49bc-92d1-2d0754662b47/front";
      hash = "sha256-6LBrAoVAtugrrfwao2nQfMApPVo/HiQBQxLfJchMX+U=";
      curlOptsList = [ "-L" ];
    };

    nativeBuildInputs = [ libjpeg_turbo ];
  }
  ''
    jpegtran -crop 1200x750+0+198 -copy none $src >$out
  ''
