{ config, ... }:
let
  kind = config.tuhana.system.kind;
in
{
  users.users.tuhana = {
    description = "Tuhana GAYRETLİ";

    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.tuhana = {
    imports = [
      ../modules/home-manager
    ];

    tuhana.programs.vscode.enable = kind != "server";

    home.stateVersion = "26.05";
  };
}
