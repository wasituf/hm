{ ... }:
{
  programs.nixvim = {
    extraConfigLua = ''
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      config.defaults.keymap.fzf["ctrl-n"] = "down";
      config.defaults.keymap.fzf["ctrl-e"] = "up";

      -- Trouble
      -- config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open

      -- Toggle root dir / cwd
      config.defaults.actions.files["ctrl-r"] = function(_, ctx)
        local o = vim.deepcopy(ctx.__call_opts)
        o.root = o.root == false
        o.cwd = nil
        o.buf = ctx.__CTX.bufnr
        LazyVim.pick.open(ctx.__INFO.cmd, o)
      end
      config.set_action_helpstr(config.defaults.actions.files["ctrl-r"], "toggle-root-dir")
    '';

    plugins = {
      fzf-lua = {
        enable = true;
        settings = {
          fzf_colors = true;
          defaults = {
            formatter = "path.dirname_first";
          };
          winopts = {
            width = 0.8;
            height = 0.8;
            row = 0.5;
            col = 0.5;
            preview = {
              scrollbar = false;
            };
          };
          files = {
            prompt = " ";
            cwd_prompt = false;
          };
          git = {
            files = {
              prompt = "Git Files: ";
            };
            status = {
              prompt = "Git Status: ";
            };
            commits = {
              prompt = "Git Commits: ";
            };
          };
          grep = {
            prompt = "Live Grep: ";
            input_prompt = "Grep: ";
          };
          buffers = {
            prompt = " ";
          };
          keymaps = {
            prompt = "Keymaps: ";
          };
          quickfix_stack = {
            prompt = "Quickfix: ";
          };
          lsp = {
            prompt_postfix = ": ";
            code_actions.prompt = "Code Actions: ";
            finder.prompt = "Finder: ";
            diagnostics.prompt = "Diagnostics: ";
          };
          previewers = {
            builtin = {
              extensions = {
                "png" = {
                  cmd = "ueberzug";
                  args = { };
                };
                "jpg" = {
                  cmd = "ueberzug";
                  args = { };
                };
                "jpeg" = {
                  cmd = "ueberzug";
                  args = { };
                };
                "gif" = {
                  cmd = "ueberzug";
                  args = { };
                };
                "svg" = {
                  cmd = "ueberzug";
                  args = { };
                };
                "webp" = {
                  cmd = "ueberzug";
                  args = { };
                };
              };
              ueberzug_scaler = "fit_contain";
            };
          };
        };
        keymaps = {
          # Files
          "<leader>fp" = {
            action = "files";
            options = {
              desc = "Find Files";
            };
          };
          "<leader><space>" = {
            action = "files";
            options = {
              desc = "Find Files";
            };
          };
          "<leader>fb" = {
            action = "buffers";
            options = {
              desc = "Buffers";
            };
          };
          "<leader>fg" = {
            action = "git_files";
            options = {
              desc = "Find Files (git-files)";
            };
          };

          # Git
          "<leader>gc" = {
            action = "git_commits";
            options = {
              desc = "Commits";
            };
          };
          "<leader>gs" = {
            action = "git_status";
            options = {
              desc = "Status";
            };
          };

          "<leader>sg" = {
            action = "live_grep";
            options = {
              desc = "Live Grep";
            };
          };
          "<leader>sc" = {
            action = "command_history";
            options = {
              desc = "Command History";
            };
          };
          "<leader>sd" = {
            action = "diagnostics_document";
            options = {
              desc = "Document Diagnostics";
            };
          };
          "<leader>sD" = {
            action = "diagnostics_workspace";
            options = {
              desc = "Workspace Diagnostics";
            };
          };
          "<leader>sk" = {
            action = "keymaps";
            options = {
              desc = "Keymaps";
            };
          };
          "<leader>sq" = {
            action = "quickfix";
            options = {
              desc = "Quickfix List";
            };
          };
        };
      };
    };
  };
}
