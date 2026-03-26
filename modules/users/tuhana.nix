{
  __findFile ? __findFile,
  ...
}:
{
  den.aspects = {
    tuhana = {
      includes = [
        (<den/user-shell> "zsh")
        <den/primary-user>

        <caden/gnome/shell>
        <caden/gnome/shell/extensions>
        <caden/gnome/shell/settings>

        <caden/programs/zsh>
        <caden/programs/zsh/plugins>
        <caden/programs/gh>
        <caden/programs/direnv>
        <caden/programs/vscode>
        <caden/programs/starship>
        <caden/programs/git>
        <caden/programs/git/users/tuhana>
      ];

      nixos = _: {
        users.users.tuhana = {
          description = "Tuhana GAYRETLİ";

          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow"
            "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
          ];
        };
      };

      homeManager = _: {
        home.stateVersion = "26.05";
      };
    };
  };
}
