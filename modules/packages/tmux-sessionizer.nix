{
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.custom-pkgs.tmux-sessionizer = {
    package = mkOption {
      type = types.package;
      default = pkgs.writeTextFile {
        name = "tmux-sessionizer";
        destination = "/bin/tmux-sessionizer";
        executable = true;
        text = ''
          #!/usr/bin/env bash
                  
          if [[ $# -eq 1 ]]; then
          	selected=$1
          else
          	selected=$(find ~/dev/* -mindepth 1 -maxdepth 1 -type d | gum filter)
          fi

          if [[ -z $selected ]]; then
          	exit 0
          fi

          session_name=$(basename "$selected" | tr ' ' '_')
          cd $selected && tmuxp load dev -s $session_name
        '';
      };
      description = "Script to switch between specialisations";
    };
  };
}
