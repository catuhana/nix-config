{ inputs, den, ... }:
{
  imports = [ (inputs.den.namespace "caden" false) ];
  _module.args.__findFile = den.lib.__findFile;
}
