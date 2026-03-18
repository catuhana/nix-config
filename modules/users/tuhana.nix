{
  den,
  __findFile ? __findFile,
  ...
}:
{
  den.aspects.tuhana = {
    includes = [
      (den._.user-shell "zsh")
      <den/primary-user>

      <caden/gnome/extensions>
      <caden/gnome/settings/accent-colour/purple>
      <caden/gnome/settings/wallpapers/and-the-circus-leaves-town>

      <caden/programs/zsh>
      <caden/programs/zsh/plugins>

      <caden/programs/gh>
      <caden/programs/direnv>
      <caden/programs/vscode>
      <caden/programs/starship>
      <caden/programs/git>
      <caden/programs/git/users/tuhana>
    ];

    nixos.users.users.tuhana = {
      description = "Tuhana GAYRETLİ";

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINRxlolhp8bTNWcjkPz/Ib3jeru3r3URp3QGAY/meoww meow"
        "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBKYu6luGMLWJ66nJxf/UrS18bHs2ru9rOzVaOKk+7THCdacTcq8IrEuvF8L0snXiCc9OtxvkUr05sN448cub2sw="
      ];
    };

    homeManager.home.stateVersion = "26.05";
  };
}
