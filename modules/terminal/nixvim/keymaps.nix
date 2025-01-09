{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };
    keymaps = [
      # Motions
      {
        action = "h";
        key = "m";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "j";
        key = "n";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "k";
        key = "e";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "l";
        key = "i";
        mode = [
          "n"
          "x"
        ];
      }
      {
        action = "e";
        key = "l";
        mode = [
          "n"
          "x"
        ];
      }

      {
        action = "i";
        key = "h";
        mode = [
          "n"
          "x"
          "o"
        ];
      }

      {
        action = "nzzzv";
        key = "k";
        mode = [ "n" ];
      }
      {
        action = "Nzzzv";
        key = "K";
        mode = [ "n" ];
      }

      {
        action = "<C-d>zz";
        key = "<C-n>";
        mode = [ "n" ];
      }
      {
        action = "<C-u>zz";
        key = "<C-e>";
        mode = [ "n" ];
      }

      {
        action = ":m '>+1<CR>gv=gv";
        key = "N";
        mode = [ "x" ];
      }
      {
        action = ":m '<-2<CR>gv=gv";
        key = "E";
        mode = [ "x" ];
      }

      # Registers
      {
        action = "\"_dP";
        key = "<leader>p";
        mode = [ "x" ];
        options = {
          desc = "Paste to void";
        };
      }
      {
        action = "\"+y";
        key = "<leader>y";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Copy to clipboard";
        };
      }
      {
        action = "\"+Y";
        key = "<leader>Y";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Copy line to clipboard";
        };
      }
      {
        action = "\"_d";
        key = "<leader>d";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Delete to void";
        };
      }
      {
        action = "V\"_d";
        key = "<leader>dd";
        mode = [
          "n"
        ];
        options = {
          desc = "Delete line to void";
        };
      }

      # Miscellaneous
      {
        action = ":%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>";
        key = "<leader>s";
        mode = [ "n" ];
        options = {
          desc = "Replace all instances of word";
        };
      }
      {
        action = "<cmd>!chmod +x %<CR>";
        key = "<leader>ch";
        mode = [ "n" ];
        options = {
          desc = "Chmod current file";
        };
      }
      {
        action = "<C-R>";
        key = "<C-u>";
        mode = [
          "n"
          "v"
        ];
      }

      # Buffers
      {
        action = "<cmd>bd!<CR>";
        key = "<leader>bd";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Close current buffer (forced)";
        };
      }
      {
        action = "<cmd>bprevious<CR>";
        key = "<C-m>";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Buffer Previous";
        };
      }
      {
        action = "<cmd>bnext<CR>";
        key = "<C-i>";
        mode = [
          "n"
          "v"
        ];
        options = {
          desc = "Buffer Next";
        };
      }
    ];
  };
}
