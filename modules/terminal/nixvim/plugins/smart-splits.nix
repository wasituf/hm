{ ... }:
{
  programs.nixvim = {
    plugins.smart-splits = {
      enable = true;
      settings = {
        default_amount = 2;
        resize_mode = {
          quit_key = "<ESC>";
          resize_keys = [
            "m"
            "n"
            "e"
            "i"
          ];
          slient = true;
        };
      };
    };

    keymaps = [
      # Resizing splits
      {
        action = "<cmd>SmartResizeLeft<CR>";
        key = "<A-M>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartResizeDown<CR>";
        key = "<A-N>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartResizeUp<CR>";
        key = "<A-E>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartResizeRight<CR>";
        key = "<A-I>";
        mode = [
          "n"
          "x"
        ];
      }

      # Moving between splits
      {
        action = "<cmd>SmartCursorMoveLeft<CR>";
        key = "<A-m>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartCursorMoveDown<CR>";
        key = "<A-n>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartCursorMoveUp<CR>";
        key = "<A-e>";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "<cmd>SmartCursorMoveRight<CR>";
        key = "<A-i>";
        mode = [
          "n"
          "x"
        ];
      }
    ];
  };
}
