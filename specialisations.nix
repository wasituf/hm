{ ... }:
{
  specialisation = {
    kanagawa = {
      configuration = {
        modules = {
          nixvim.colorscheme = "kanagawa";
          ghostty.theme = "Kanagawa Wave";
          emacs.colorscheme = "kanagawa-wave";
        };
      };
    };
    catppuccin = {
      configuration = {
        modules = {
          nixvim.colorscheme = "catppuccin";
          ghostty.theme = "catppuccin-mocha";
          emacs.colorscheme = "catppuccin";
        };
      };
    };
    rose-pine = {
      configuration = {
        modules = {
          nixvim.colorscheme = "rose-pine";
          ghostty.theme = "rose-pine";
          emacs.colorscheme = "rose-pine";
        };
      };
    };
  };
}
