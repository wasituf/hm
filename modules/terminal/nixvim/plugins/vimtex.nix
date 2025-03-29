{ ... }:
{
  programs.nixvim = {
    plugins.vimtex = {
      enable = true;
      autoLoad = true;
      settings = {
        compiler_method = "tectonic";
        view_method = "zathura";
      };
    };
  };
}
