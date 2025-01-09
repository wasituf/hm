{ ... }:
{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      lazyLoad.settings.event = "UIEnter";
      settings = {
        delay = 150;
        preset = "helix";
        win = {
          border = "rounded";
          wo.winblend = 25;
        };
        spec = [
          {
            __unkeyed-1 = "<leader><tab>";
            group = "tabs";
            icon = "󰓩 ";
          }
          {
            __unkeyed-1 = "<leader>b";
            group = "buffers";
            icon = "󰈔 ";
            expand = {
              __raw = ''
                function()
                  return require("which-key.extras").expand.buf()
                end
              '';
            };
          }
          {
            __unkeyed-1 = "<leader>f";
            group = "file/find";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>l";
            group = "lsp";
            icon = "󰁨 ";
          }
          {
            __unkeyed-1 = "<leader>s";
            group = "search";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>w";
            group = "window";
            icon = " ";
            proxy = "<C-w>";
            expand = {
              __raw = ''
                function()
                  return require("which-key.extras").expand.win()
                end
              '';
            };
          }
          {
            __unkeyed-1 = "<leader>x";
            group = "lists";
            icon = {
              icon = "󱖫 ";
              color = "green";
            };
          }
          {
            __unkeyed-1 = "[";
            group = "prev";
          }
          {
            __unkeyed-1 = "]";
            group = "next";
          }
          {
            __unkeyed-1 = "g";
            group = "goto";
          }
          {
            __unkeyed-1 = "gs";
            group = "surround";
          }
          {
            __unkeyed-1 = "z";
            group = "fold";
          }
        ];
      };
    };
  };
}
