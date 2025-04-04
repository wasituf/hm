{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      eyeliner-nvim
      supermaven-nvim
    ];

    extraConfigLua = ''
      require("eyeliner").setup({
        highlight_on_key = true,
        dim = true,
        max_length = 9999,
        disabled_filetypes = {},
        default_keymaps = true,
      })

      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-]>",
          clear_suggestion = "<C-c>",
          accept_word = "<C-j>",
        },
        disable_keymaps = false;
        ignore_filetypes = { }, -- { cpp = true, } or { "cpp", }
      })
    '';
  };
}
