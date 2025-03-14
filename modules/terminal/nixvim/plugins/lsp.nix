{ lib, pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      inlayHints = true;
      # capabilities = '''';
      # onAttach = '''';
      # preConfig = '''';
      keymaps = {
        lspBuf = {
          L = "hover";
        };
      };
      servers = {
        astro.enable = true;
        bashls.enable = true;
        cssls.enable = true;
        # css_variables.enable = true;
        # denols.enable = true;
        docker_compose_language_service.enable = true;
        dockerls.enable = true;
        emmet_ls.enable = true;
        eslint.enable = true;
        # fish_lsp.enable = true;
        # gdscript.enable = true;
        # gdshader_lsp.enable = true;
        gleam.enable = true;
        glsl_analyzer.enable = true;
        gopls = {
          enable = true;
          settings = {
            gopls = {
              analyses = {
                unusedparams = true;
              };
              staticcheck = true;
              gofumpt = true;
            };
          };
        };
        # guile_ls.enable = true;
        html.enable = true;
        # htmx.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        # mdx_analyzer.enable = true;
        nil_ls.enable = true;
        nixd.enable = true;
        nushell.enable = true;
        # prismals.enable = true;
        pylyzer.enable = true;
        racket_langserver = {
          enable = true;
          package = null;
          cmd = [ "racket -l racket-langserver" ];
        };
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        sqls.enable = true;
        svelte.enable = true;
        # tailwindcss.enable = true;
        templ.enable = true;
        ts_ls.enable = true;
        # unocss = true;
        vala_ls.enable = true;
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        log_level = "warn";
        notify_on_error = true;
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 2000;
        };
        formatters_by_ft = {
          bash = [ "shfmt" ];
          shell = [ "shfmt" ];
          sh = [ "shfmt" ];
          rust = [ "rustfmt" ];
          javascript = [ "prettierd" ];
          typescript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
          vue = [ "prettierd" ];
          markdown = [ "prettierd" ];
          css = [ "prettierd" ];
          json = [ "prettierd" ];
          jsonc = [ "prettierd" ];
          scss = [ "prettierd" ];
          less = [ "prettierd" ];
          yaml = [ "prettierd" ];
          graphql = [ "prettierd" ];
          html = [ "prettierd" ];
          astro = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          }; # NOTE Maybe prettied can't do astro (or any plugins)
          lua = [ "stylua" ];
          go = [
            "gofumpt"
            "goimports"
            "golines"
          ];
          nix = [ "nixfmt" ];

          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        formatters = {
          shfmt = {
            command = lib.getExe pkgs.shfmt;
          };
          rustfmt = {
            command = lib.getExe pkgs.rustfmt;
          };
          prettierd = {
            command = lib.getExe pkgs.prettierd;
          };
          prettier = {
            command = lib.getExe pkgs.nodePackages_latest.prettier;
          };
          stylua = {
            command = lib.getExe pkgs.stylua;
          };
          gofumpt = {
            command = lib.getExe pkgs.gofumpt;
          };
          goimports = {
            command = lib.getExe' pkgs.gotools "goimports";
          };
          golines = {
            command = lib.getExe' pkgs.golines "golines";
          };
          nixfmt = {
            command = lib.getExe pkgs.nixfmt-rfc-style;
          };
          squeeze_blanks = {
            command = lib.getExe' pkgs.coreutils "cat";
          };
        };
      };
    };

    lsp-format = {
      enable = true;
      lspServersToEnable = [ "racket_langserver" ];
    };

    lsp-lines = {
      enable = false;
    };
  };
}
