{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.emacs;
in
{
  options.modules.emacs = {
    enable = mkEnableOption "emacs";
    enableDaemon = mkEnableOption "Enable the emacs daemon.";
  };

  config = mkIf cfg.enable {
    services.emacs = {
      enable = cfg.enableDaemon;
      client.enable = true;
      startWithUserSession = true;
    };

    programs.emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      extraPackages = epkgs: [
        epkgs.doom
      ];
    };

    home.packages = with pkgs; [
      fd
      ripgrep
      git
    ];
  };

}
