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
          # indent = {
          #   enabled = true;
          # };
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
        key = "<leader>nh";
        options = {
          desc = "Notification History";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.notifier.hide() end'';
        };
        key = "<leader>nd";
        options = {
          desc = "Dismiss All Notification";
        };
      }
      {
        action = {
          __raw = ''function() Snacks.bufdelete() end'';
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
          desc = "Previous Reference";
        };
      }
    ];
    autoCmd = [
      {
        callback = {
          __raw = ''
            function()
              -- Setup some globals for debugging (lazy-loaded)
              _G.dd = function(...)
                Snacks.debug.inspect(...)
              end
              _G.bt = function()
                Snacks.debug.backtrace()
              end
              vim.print = _G.dd -- Override print to use snacks for `:=` command

              -- Create some toggle mappings
              -- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
              Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
              Snacks.toggle.diagnostics():map("<leader>ud")
              Snacks.toggle.line_number():map("<leader>ul")
              -- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
              -- Snacks.toggle.treesitter():map("<leader>uT")
              Snacks.toggle.option("background", { off = "dark", on = "light", name = "Light Mode" }):map("<leader>ub")
              -- Snacks.toggle.inlay_hints():map("<leader>uh")
              Snacks.toggle.indent():map("<leader>ug")
              Snacks.toggle.dim():map("<leader>uD")
            end
          '';
        };
        pattern = [ "*" ];
        event = [ "BufEnter" ];
      }
    ];
  };
}
