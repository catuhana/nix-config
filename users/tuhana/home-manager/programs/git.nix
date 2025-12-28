{ ... }:
{
  programs = {
    git = {
      enable = true;

      settings = {
        init = {
          defaultBranch = "main";
        };

        user = {
          name = "tuhana";
          email = "tuhana.cat+git@gmail.com";
          signingkey = "~/.ssh/id_ed25519.pub";
        };
      };

      signing = {
        signByDefault = true;
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
      };
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}
