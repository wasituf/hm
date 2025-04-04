{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      eyeliner-nvim
      supermaven-nvim
      whitespace-nvim
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

      require('whitespace-nvim').setup({
        highlight = 'DiffDelete',
        ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'FzfLua', 'help', 'dashboard' },
        ignore_terminal = true,
        return_cursor = true,
      })

      -- remove trailing whitespace with a keybinding
      -- vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
    '';
  };
}
