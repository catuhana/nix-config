{
  caden.programs = {
    provides.git = {
      nixos.programs.git.enable = true;

      homeManager.programs.git = {
        enable = true;

        settings.init.defaultBranch = "main";
      };

      provides.users.provides.tuhana = {
        homeManager = {
          programs.git.settings.user = {
            name = "tuhana";
            email = "tuhana.cat+git@gmail.com";
          };
        };
      };
    };

    provides.gh.homeManager.programs.gh.enable = true;
    provides.direnv.homeManager.programs.direnv.enable = true;

    provides.msedit.nixos =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [ msedit ];

          variables = {
            EDITOR = "msedit";
            VISUAL = "msedit";
          };
        };
      };

    provides.vscode.homeManager.programs.vscode.enable = true;

    provides.zsh = {
      nixos.programs.zsh.enable = true;

      homeManager.programs.zsh = {
        enable = true;

        autocd = true;
        enableVteIntegration = true;
      };

      provides.plugins = {
        provides.zsh-autosuggestions.homeManager.programs.zsh.autosuggestion.enable = true;
        provides.zsh-syntax-highlighting.homeManager.programs.zsh.syntaxHighlighting.enable = true;

        provides.zsh-mommy = {
          homeManager.programs.zsh.plugins =
            { pkgs, ... }:
            [
              {
                name = "zsh-mommy";
                file = "zsh-mommy.zsh";
                src = pkgs.fetchgit {
                  url = "https://git.gay/tuhana/zsh-mommy";
                  rev = "ae86075156725d841c93f02be5796f1f750fcb3c";
                  sha256 = "sha256-YqbTUfasecyJrVdTEn07Ja09kyXyOSUqrtQsl/s255c=";
                };
              }
            ];
        };
      };
    };
  };
}
