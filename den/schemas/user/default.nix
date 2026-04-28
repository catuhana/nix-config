_: {
  den.schema = {
    user =
      { lib, ... }:
      {
        config = {
          classes = lib.mkDefault [ "homeManager" ];
        };
      };
  };
}
