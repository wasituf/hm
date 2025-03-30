{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      eyeliner-nvim
    ];

    extraConfigLua = ''
      require("eyeliner").setup({
        highlight_on_key = true,
        dim = true,
        max_length = 9999,
        disabled_filetypes = {},
        default_keymaps = true,
      })
    '';
  };
}
