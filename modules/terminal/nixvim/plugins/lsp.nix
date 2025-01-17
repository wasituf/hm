{ ... }:
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
        fish_lsp.enable = true;
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
        htmx.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        # mdx_analyzer.enable = true;
        nil_ls.enable = true;
        nixd.enable = true;
        nushell.enable = true;
        # prismals.enable = true;
        pylyzer.enable = true;
        sqls.enable = true;
        svelte.enable = true;
        tailwindcss.enable = true;
        templ.enable = true;
        ts_ls.enable = true;
        # unocss = true;
        vala_ls.enable = true;
      };
    };

    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    lsp-lines = {
      enable = false;
    };
  };
}
