{ ... }:
{
  programs.nixvim = {
    plugins = {
      snacks = {
        enable = true;
        settings = {
          bufdelete = {
            enabled = true;
          };
          dim = {
            enabled = true;
          };
          indent = {
            enabled = true;
          };
          input = {
            enabled = true;
          };
          notifier = {
            enabled = true;
          };
          scroll = {
            enabled = true;
          };
          statuscolumn = {
            enabled = true;
          };
          toggle = {
            enabled = true;
          };
          words = {
            enabled = true;
          };
          zen = {
            enabled = true;
          };
        };
      };
    };

    keymaps = [
      {
        action = {
          __raw = ''function() Snacks.zen() end'';
        };
        key = "<leader>z";
        options = {
          desc = "Toggle Zen Mode";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.zen.zoom() end'';
        };
        key = "<leader>Z";
        options = {
          desc = "Toggle Zoom Mode";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.notifier.show_history() end'';
        };
        key = "<leader>n";
        options = {
          desc = "Notification History";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.notifier.hide() end'';
        };
        key = "<leader>nh";
        options = {
          desc = "Dismiss All Notification";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.notifier.bufdelete() end'';
        };
        key = "<leader>bd";
        options = {
          desc = "Delete Buffer";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.words.jump(vim.v.count1) end'';
        };
        key = "]]";
        options = {
          desc = "Next Reference";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.words.jump(-vim.v.count1) end'';
        };
        key = "[[";
        options = {
          desc = "Next Reference";
        };
      }
    ];
  };
}
