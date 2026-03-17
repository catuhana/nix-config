{ den, ... }:
{
  den.aspects.tuhana = {
    includes = [ (den.provides.user-shell "zsh") ];

    homeManager.home.stateVersion = "26.05";
  };
}
