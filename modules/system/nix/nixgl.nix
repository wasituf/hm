{
  lib,
  config,
  nixgl,
  ...
}:
with lib;
let
  cfg = config.modules.nixgl;
in
{
  options.modules.nixgl = {
    enable = mkEnableOption "nixgl";
  };

  config = mkIf cfg.enable {
    nixGL = {
      packages = nixgl.packages;
      defaultWrapper = "nvidia";
      installScripts = [ "nvidia" ];
    };
  };
}
