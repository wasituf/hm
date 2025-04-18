{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.nixvim;
in
{
  imports = [
    ./colorschemes.nix
    ./ftplugins.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  options.modules.nixvim = {
    enable = mkEnableOption "nixvim";
    colorscheme = mkOption {
      type = types.enum [
        "catppuccin"
        "rose-pine"
        "kanagawa"
      ];
      default = "kanagawa";
      description = "The colorscheme applied to neovim.";
    };
  };

  config = mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      diagnostics = {
        virtual_lines = {
          current_line = true;
        };
        virtual_text = false;
      };
      colorscheme = cfg.colorscheme;
      clipboard.providers = {
        xclip.enable = true;
        wl-copy.enable = true;
      };
      vimAlias = true;
    };
  };
}
