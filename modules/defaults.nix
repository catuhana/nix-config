{
  __findFile ? __findFile,
  ...
}:
{
  den = {
    default = {
      includes = [
        <den/hostname>
        <den/define-user>
      ];

      nixos =
        { pkgs, ... }:
        {
          nixpkgs.config.allowUnfree = true;

          nix = {
            package = pkgs.lixPackageSets.stable.lix;

            settings = {
              experimental-features = [
                "nix-command"
                "flakes"
                "cgroups"
                "auto-allocate-uids"
              ];

              use-cgroups = true;
              auto-allocate-uids = true;
            };

            optimise.automatic = true;
          };
        };

      homeManager.nixpkgs.config.allowUnfree = true;
    };

    schema.user.classes = [ "homeManager" ];
  };
}
