{ pkgs, ... }:
{
  users = {
    defaultUserShell = with pkgs; zsh;
  };
}
