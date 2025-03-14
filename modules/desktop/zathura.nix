{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.zathura;
in
{
  options.modules.zathura = {
    enable = mkEnableOption "zathura";
  };

  config = mkIf cfg.enable {
    programs.zathura = {
      enable = true;
      mappings = {
        n = "scroll down";
        e = "scroll up";
        m = "scroll left";
        i = "scroll right";
      };
      options = {
        adjust-open = "width";
        continuous-hist-save = "true";
        database = "sqlite";
      };
      extraConfig = ''
        include catppuccin-mocha
      '';
    };
  };
}
