{ caden, den, ... }:
{
  den.hosts.x86_64-linux.MateBookD14 = {
    users.tuhana = { };
  };

  den.aspects.MateBookD14 = {
    nixos = {
      system.stateVersion = "26.05";
    };

    includes =
      let
        inherit (caden)
          audio
          boot
          gnome
          locale
          programs
          security
          services
          time
          ;
      in
      [
        den.provides.hostname

        audio

        boot
        boot.provides.secure-boot
        boot.provides.silent-boot
        boot.provides.plymouth

        gnome
        gnome.provides.gnome-extensions
        gnome.provides.gnome-extensions.provides.blur-my-shell
        gnome.provides.gnome-extensions.provides.caffeine
        gnome.provides.gnome-extensions.provides.appindicator

        locale.provides.tr_TR
        locale.provides.en_GB

        programs.provides.gh
        programs.provides.git
        programs.provides.git.provides.users.provides.tuhana
        programs.provides.direnv
        programs.provides.msedit
        programs.provides.zsh
        programs.provides.zsh.provides.plugins.provides.zsh-autosuggestions
        programs.provides.zsh.provides.plugins.provides.zsh-syntax-highlighting
        programs.provides.zsh.provides.plugins.provides.zsh-mommy

        security.provides.apparmor
        security.provides.tpm2

        services.provides.flatpak
        services.provides.openssh
        services.provides.scx

        time
        time.provides.Istanbul
      ];
  };
}
