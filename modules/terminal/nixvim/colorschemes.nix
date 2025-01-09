{ ... }:
{
  programs.nixvim = {
    colorschemes = {
      kanagawa = {
        enable = true;
        settings = {
          background = {
            light = "lotus";
            dark = "wave";
          };
          theme = "wave";
          transparent = false;
          dimInactive = false;
          colors = {
            theme = {
              all = {
                ui = {
                  bg_gutter = "none";
                };
              };
            };
          };
          overrides = ''
            function(colors)
              local theme = colors.theme
              local makeDiagnosticColor = function(color)
                local c = require("kanagawa.lib.color")
                return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
              end

              return {
                MiniIndentscopeSymbol = { fg = theme.ui.nontext },

                -- Disable float bg
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle = { bg = "none" },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

                Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },  -- add `blend = vim.o.pumblend` to enable transparency
                PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                PmenuSbar = { bg = theme.ui.bg_m1 },
                PmenuThumb = { bg = theme.ui.bg_p2 },

                DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
              }
            end
          '';
        };
      };
      catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          background = {
            light = "latte";
            dark = "mocha";
          };
          transparent_background = false;
          show_end_of_buffer = false;
          styles = {
            comments = [ "italic" ];
            conditionals = [ "italic" ];
            keywords = [ "italic" ];
          };
          integrations = {
            flash = true;
            harpoon = true;
            markdown = true;
            mason = true;
            noice = true;
            cmp = true;
            mini = {
              enabled = true;
              indentscope_color = "surface0";
            };
            notify = true;
            nvimtree = true;
            telescope = {
              enabled = true;
              style = "astronvim";
            };
            treesitter = true;
            treesitter_context = true;
            window_picker = true;
            lsp_trouble = true;
            ufo = true;
            which_key = true;
            illuminate = {
              enabled = true;
              lsp = true;
            };
            navic = {
              enabled = true;
              custom_bg = "NONE"; # "lualine" will set background to mantle
            };
          };
        };
      };
      rose-pine = {
        enable = true;
        settings = {
          variant = "auto";
          dark_variant = "main";
          dim_inactive_windows = false;

          styles = {
            transparency = false;
          };

          highlight_groups = {
            MiniIndentscopeSymbol = {
              fg = "highlight_med";
            };
            WhichKeyNormal = {
              bg = "none";
            };
            WhichKeyBorder = {
              bg = "none";
            };
            WhichKeyTitle = {
              bg = "none";
            };
          };
        };
      };
    };
  };
}
