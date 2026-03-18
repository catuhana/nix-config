{
  caden.gnome.nixos = {
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;

      gnome = {
        core-developer-tools.enable = false;
        games.enable = false;
      };
    };

    # Maybe turn these into separate `provides`?
    programs.dconf.profiles.user.databases = [
      {
        settings = {
          "org/gnome/mutter" = {
            experimental-features = [
              "scale-monitor-framebuffer" # Fractional scaling
              "xwayland-native-scaling"
            ];
          };
        };
      }
    ];
  };
}
