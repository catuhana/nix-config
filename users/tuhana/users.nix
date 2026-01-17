# TODO: Maybe flatten `users/<home>/*.nix` into a
# single `users/<home>.nix` file?
{ pkgs, ... }:
{
  users.users.tuhana = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
