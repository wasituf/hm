{ pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "wasituf";
  home.homeDirectory = "/home/wasituf";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nil
    nixd
    # nixfmt-rfc-style
    # prettierd
    # gofumpt
    # gotools
    # golines
    # shfmt
    # stylua
  ];

  # Modules
  modules = {
    # packages
    packages.enable = true;

    # desktop
    /*
      emacs = {
        enable = true;
        enableDaemon = true;
      };
      spicetify.enable = true;
      zathura.enable = true;
    */

    # /terminal
    eza.enable = false;
    ghostty.enable = false;
    gitui.enable = false;
    nixvim.enable = true;
    tmux = {
      enable = true;
      theme = "kanagawa";
    };
    zoxide.enable = false;

    # system
    direnv.enable = true;
    nh.enable = true;
    nixpkgs.enable = true;
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
    BROWSER = "zen-browser";
    FLAKE = "$HOME/hm";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
