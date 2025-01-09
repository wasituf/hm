{ ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      folding = false;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
    treesitter-context = {
      enable = true;
      settings = {
        # mode = "topline"; # topline | cursor
        separator = "-";
      };
    };
    ts-context-commentstring = {
      enable = true;
    };
  };
}
