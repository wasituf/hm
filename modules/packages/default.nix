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
  imports = [
    ./theme-switch.nix
    ./tmux-sessionizer.nix
  ];

  options.modules.packages = {
    enable = mkEnableOption "packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # desktop
      # (config.lib.nixGL.wrap gitbutler)
      gimp
      (config.lib.nixGL.wrap hoppscotch)
      inkscape-with-extensions

      # misc
      any-nix-shell
      gum

      # scripts
      config.custom-pkgs.theme-switch.package
      config.custom-pkgs.tmux-sessionizer.package
    ];
  };
}
