{ ... }:
{
  specialisation = {
    kanagawa = {
      configuration = {
        modules = {
          nixvim.colorscheme = "kanagawa";
          ghostty.theme = "Kanagawa Wave";
        };
      };
    };
    catppuccin = {
      configuration = {
        modules = {
          nixvim.colorscheme = "catppuccin";
          ghostty.theme = "catppuccin-mocha";
        };
      };
    };
    rose-pine = {
      configuration = {
        modules = {
          nixvim.colorscheme = "rose-pine";
          ghostty.theme = "rose-pine";
        };
      };
    };
  };
}
