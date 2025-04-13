{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.fonts;
in
{
  options.modules.fonts = {
    enable = mkEnableOption "fonts";
  };

  config = mkIf cfg.enable {
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      nerd-fonts.agave
      nerd-fonts.caskaydia-cove
      nerd-fonts.fira-code
      nerd-fonts.geist-mono
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
      nerd-fonts.zed-mono
    ];
  };
}
