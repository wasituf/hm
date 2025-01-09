{ lib, config, ... }:
with lib;
let
  cfg = config.modules.nixpkgs;
in
{

  options.modules.nixpkgs = {
    enable = mkEnableOption "nixpkgs";
  };

  config = mkIf cfg.enable {
    nixpkgs.config = {
      allowUnfreePredicate = (pkg: true);
    };

    home.file.".config/nixpkgs/config.nix".text = ''
      {
        allowUnfreePredicate = (pkg: true);
      }
    '';
  };
}
