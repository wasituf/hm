{ ... }:
{
  programs.nixvim = {
    fzf-lua = {
      enabled = true;
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
        };
        files = {
          cwd_prompt = false;
        };
      };
      keymaps = {
        "<leader>fp" = "files";
        "<leader>fb" = "buffers";
        "<leader>gc" = "git_commits";
        "<leader>gs" = "git_status";
        "<leader>fg" = "git_files";

        "<leader>sg" = "live_grep";
        "<leader>sc" = "command_history";
        "<leader>sd" = "diagnostcs_document";
        "<leader>sD" = "diagnostcs_workspace";
        "<leader>sk" = "keymaps";
        "<leader>sq" = "quickfix";
      };
    };
  };
}
