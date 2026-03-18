{
  caden.programs.provides.msedit.nixos =
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
}
