{ pkgs, ... }:
{
  programs.gnome-shell = {
    enable = true;

    extensions = with pkgs; [
      {
        package = gnomeExtensions.blur-my-shell;
      }
      {
        package = gnomeExtensions.caffeine;
      }
    ];
  };
}
