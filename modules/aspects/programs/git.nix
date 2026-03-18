{
  caden.programs.provides.git = {
    nixos.programs.git.enable = true;

    homeManager.programs.git = {
      enable = true;

      settings.init.defaultBranch = "main";
    };

    provides.users._.tuhana = {
      homeManager = {
        programs.git = {
          settings.user = {
            name = "tuhana";
            email = "tuhana.cat+git@gmail.com";
          };

          signing = {
            signByDefault = true;
            format = "ssh";
            key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow";
          };
        };
      };
    };
  };
}
