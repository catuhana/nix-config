{ osConfig, ... }:
let
  kind = osConfig.tuhana.system.kind;
in
{
  imports = [
    ../../modules/home-manager
  ];

  tuhana.programs.vscode.enable = kind != "server";

  home.stateVersion = "26.05";
}
