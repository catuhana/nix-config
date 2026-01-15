{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkMerge
    mkIf
    mkEnableOption
    ;

  cfg = config.tuhana.core.security;
in
{
  options.tuhana.core.security = {
    apparmor.enable = mkEnableOption "Enable AppArmor";

    useSudoRs = mkEnableOption "Use `sudo-rs` instead of `sudo`" // {
      default = true;
    };

    tpm2.enable = mkEnableOption "Enable TPM2 support";
  };

  config = mkMerge [
    (mkIf cfg.apparmor.enable {
      security.apparmor.enable = true;
    })

    (mkIf cfg.useSudoRs {
      security = {
        sudo.enable = false;
        sudo-rs.enable = true;
      };
    })

    (mkIf cfg.tpm2.enable {
      security.tpm2 = {
        enable = true;

        abrmd.enable = true;
        pkcs11.enable = true;

        tctiEnvironment = {
          enable = true;
          interface = "tabrmd";
        };
      };
    })
  ];
}
