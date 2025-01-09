{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.packages;
in
{
  imports = [ ./theme-switch.nix ];

  options.modules.packages = {
    enable = mkEnableOption "packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # desktop
      # (config.lib.nixGL.wrap gitbutler)

      # misc
      any-nix-shell

      # scripts
      config.custom-pkgs.theme-switch.package
    ];
  };
}
