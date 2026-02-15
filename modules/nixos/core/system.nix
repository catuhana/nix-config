{
  lib,
  ...
}:
let
  inherit (lib)
    mkOption
    types
    ;
in
{
  options.tuhana.system = {
    kind = mkOption {
      type = types.enum [
        "laptop"
        "desktop"
        "server"
      ];
      description = "The kind of system being built (laptop, desktop, or server)";
    };
  };
}
