{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShellNoCC {
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
