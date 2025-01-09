{ ... }:
{
  programs.nixvim = {
    plugins.undotree = {
      enable = true;
    };
    keymaps = [

      {
        action = "<cmd>UndotreeToggle<CR>";
        key = "<leader>uu";
        mode = [
          "n"
          "v"
        ];
      }
    ];
  };
}
