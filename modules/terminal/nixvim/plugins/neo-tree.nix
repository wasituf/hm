{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded";
      # useDefaultMappings = false;
      filesystem = {
        bindToCwd = false;
        useLibuvFileWatcher = true;
      };
      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = "";
          expanderExpanded = "";
          expanderHighlight = "NeoTreeExpander";
        };
        gitStatus = {
          symbols = {
            unstaged = "󰄱";
            staged = "󰱒";
          };
        };
      };
      window = {
        position = "float";
        width = 50;
        mappings = {
          e = "";
        };
      };
    };
    keymaps = [
      {
        action = {
          __raw = ''
            function()
              require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
            end
          '';
        };
        key = "<leader>fe";
        mode = [
          "n"
          "x"
        ];
        options = {
          desc = "NeoTree";
        };
      }
      {
        action = {
          __raw = ''
            function()
              require("neo-tree.command").execute({ source = "buffers", toggle = true })
            end
          '';
        };
        key = "<leader>be";
        mode = [
          "n"
          "x"
        ];
        options = {
          desc = "Buffers in NeoTree";
        };
      }
    ];
  };
}
