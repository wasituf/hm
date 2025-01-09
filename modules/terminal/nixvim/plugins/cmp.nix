{ ... }:
{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completeion = {
          completeopt = "menu,menuone,preview,noselect";
        };
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-l>" = "cmp.mapping.confirm()";
          "<C-;>" = "cmp.mapping.close()";
          "<C-n>" = "cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })";
          "<C-e>" = "cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })";
          "<C-u>" = "cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 's' })";
          "<C-y>" = "cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 's' })";
        };
        snippet.expand = ''
          function(args)
            luasnip.lsp_expand(args.body)
          end
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "luasnip"; }
          { name = "async_path"; }
          { name = "emoji"; }
          { name = "latex_symbols"; }
          { name = "buffer"; }
        ];
        window = {
          completion = {
            border = "rounded";
            winhighlight = "";
          };
          documentation = {
            border = "rounded";
          };
        };
      };
    };

    friendly-snippets.enable = true;

    luasnip = {
      enable = true;
      fromVscode = [
        {
          lazyLoad = true;
        }
      ];
      filetypeExtend = {
        astro = [
          "js"
          "ts"
          "css"
          "html"
        ];
        nix = [
          "bash"
          "fish"
          "lua"
        ];
      };
    };

    lspkind = {
      enable = true;
      mode = "symbol_text";
      cmp = {
        ellipsisChar = "...";
        maxWidth = 50;
      };
    };
  };
}
