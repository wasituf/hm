{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.ghostty;
in
{
  options.modules.ghostty = {
    enable = mkEnableOption "ghostty";
    theme = mkOption {
      type = types.enum [
        "Kanagawa Wave"
        "catppuccin-mocha"
        "rose-pine"
      ];
      default = "Kanagawa Wave";
      example = "Kanagawa Wave";
      description = "Theme for ghostty. Kanagawa Wave | catppuccin | rose-pine";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      (config.lib.nixGL.wrap pkgs.ghostty)
    ];
    home.file.".config/ghostty/config".text = ''
      font-family=JetBrainsMono NF
      font-size=11
      window-decoration=false
      window-padding-x=0
      window-padding-y=0
      window-padding-balance=true
      theme=${cfg.theme}
      background-opacity=1
      background-blur-radius=20

      keybind=ctrl+backspace=text:\x1b\x7f
      keybind=ctrl+alt+y=jump_to_prompt:-1
      keybind=ctrl+alt+u=jump_to_prompt:1
    '';

  };
}
