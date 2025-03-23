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
    emacs = {
      enable = true;
      enableDaemon = true;
    };
    spicetify.enable = true;
    zathura.enable = true;

    # terminal
    eza.enable = true;
    ghostty.enable = true;
    gitui.enable = true;
    nixvim.enable = true;
    tmux = {
      enable = true;
      theme = "kanagawa";
    };
    zoxide.enable = true;

    # system
    direnv.enable = true;
    nh.enable = true;
    nixgl.enable = true;
    nixpkgs.enable = true;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    # "tmux.conf"
  };

  home.sessionVariables = {
    TERMINAL = "ghostty";
    BROWSER = "zen-browser";
    FLAKE = "$HOME/hm";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
