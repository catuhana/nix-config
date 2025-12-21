{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      msedit
    ];

    variables = {
      EDITOR = "msedit";
      VISUAL = "msedit";
    };

    shellAliases = {
      ".." = "cd ..";
    };
  };
}
