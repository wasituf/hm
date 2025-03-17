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
    ./flake-init.nix
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
      config.custom-pkgs.flake-init.package
      config.custom-pkgs.theme-switch.package
      config.custom-pkgs.tmux-sessionizer.package
    ];
  };
}
