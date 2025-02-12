{ config, lib, spicetify-nix, pkgs, ... }:
with lib;
let
  cfg = config.modules.spicetify;
in
{
  options.modules.spicetify = {
    enable = mkEnableOption "spicetify";
  };

  config = mkIf cfg.enable {
    programs.spicetify = 
      let
        spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle
        ];
        theme = spicePkgs.themes.catppuccin;
      };
  };
}
