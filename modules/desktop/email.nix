{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.email;
in
{
  options.modules.email = {
    enable = mkEnableOption "email";
    enableThunderbird = mkEnableOption "thunderbird client";
  };

  config = mkIf cfg.enable {
    accounts.email.accounts = {
      proton = {
        address = "wasit.allin1@proton.me";
        primary = true;
        realName = "Wasit Faraizi";
        thunderbird = {
          enable = true;
          profiles = [ "proton" ];
        };
        userName = "wasituf";
      };
    };

    programs.thunderbird = {
      enable = cfg.enableThunderbird;
      package = pkgs.thunderbird-latest-unwrapped;
      profiles = {
        proton = {
          isDefault = true;
          extensions = with pkgs; [ ];
          search = {
            default = "Brave";
            engines = {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "Bing".metaData.hidden = true;
              "Brave".metaData.alias = "@br";
              "DuckDuckGo".metaData.alias = "@dg";
              "Google".metaData.alias = "@g";
            };
            force = true;
            order = [
              "Brave"
              "Google"
              "Nix Packages"
              "DuckDuckGo"
            ];
            privateDefault = "DuckDuckGo";
          };
          settings = {
            "mail.spellcheck.inline" = false;
          };
        };
      };
      settings = { };
    };
  };
}
