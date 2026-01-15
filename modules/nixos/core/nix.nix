{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    ;

  cfg = config.tuhana.core.nix;
in
{
  options.tuhana.core.nix = {
    gc.enable = mkEnableOption "Enable automatic garbage collection";
  };

  config = {
    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];

        auto-optimise-store = true;
      };

      gc = lib.mkIf cfg.gc.enable {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };
    };
  };
}
