# TODO: Maybe flatten `users/<home>/*.nix` into a
# single `users/<home>.nix` file?
{ ... }:
{
  users.users.tuhana = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
