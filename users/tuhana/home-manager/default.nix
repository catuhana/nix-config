{ ... }:
{
  imports = [
    ./programs/desktop.nix
    ./programs/git.nix
  ];

  home.stateVersion = "26.05";
}
