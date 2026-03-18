{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = builtins.attrValues {
          inherit (pkgs)
            nixd
            nixfmt
            ;
        };
      };

      formatter = pkgs.nixfmt-tree;
    };
}
