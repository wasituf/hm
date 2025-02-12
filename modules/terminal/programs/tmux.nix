{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.tmux;
in
{
  options.modules.tmux = {
    enable = mkEnableOption "tmux";
    theme = mkOption {
      type = types.enum [
        "kanagawa"
        "rose-pine"
        "catppuccin"
      ];
      default = "rose-pine";
      description = "The theme applied to tmux.";
      example = "catppuccin";
    };
  };

  config = mkIf cfg.enable {
    # Static
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      disableConfirmationPrompt = true;
      escapeTime = 10;
      focusEvents = true;
      historyLimit = 5000;
      keyMode = "vi";
      mouse = true;
      resizeAmount = 3;
      sensibleOnTop = true;
      shortcut = "Space";
      terminal = "screen-256color";
      tmuxp.enable = true;

      # String config
      extraConfig = ''
        # Unbind defaults
        unbind C-b
        unbind %
        unbind \"
        unbind o
        unbind n
        unbind v
        unbind h
        unbind A
        unbind D

        # Pane manipulations
        bind-key v split-window
        bind-key h split-window -h

        # Window manipulations
        bind-key -n M-U previous-window
        bind-key -n M-Y next-window

        bind-key A command-prompt "kill-session -a"
        bind-key D kill-session

        # Smart pane switching with awareness of Neovim splits.
        is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
        bind-key -n M-m if -F "#{@pane-is-vim}" 'send-keys C-h'  'select-pane -L'
        bind-key -n M-n if -F "#{@pane-is-vim}" 'send-keys C-j'  'select-pane -D'
        bind-key -n M-e if -F "#{@pane-is-vim}" 'send-keys C-k'  'select-pane -U'
        bind-key -n M-i if -F "#{@pane-is-vim}" 'send-keys C-l'  'select-pane -R'

        # Smart pane resizing with awareness of Neovim splits.
        bind-key -n M-M if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 2'
        bind-key -n M-N if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 2'
        bind-key -n M-E if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 2'
        bind-key -n M-I if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 2'

        tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
        if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
        if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
        "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

        bind-key -T copy-mode-vi 'M-m' select-pane -L
        bind-key -T copy-mode-vi 'M-n' select-pane -D
        bind-key -T copy-mode-vi 'M-e' select-pane -U
        bind-key -T copy-mode-vi 'M-i' select-pane -R
        bind-key -T copy-mode-vi 'M-\' select-pane -l

        ${optionalString (cfg.theme == "rose-pine") ''
          # Window status formatting
          set-window-option -g window-status-format "#I_#W "
          set-window-option -g window-status-current-format " [ #W ] "

        ''}
      '';

      # Dynamic
      plugins = with pkgs.tmuxPlugins; [
        (mkIf (cfg.theme == "rose-pine") {
          plugin = rose-pine;
          extraConfig = ''
            set -g @rose_pine_variant 'main'
            set -g @rose_pine_host 'on'
            set -g @rose_pine_user 'on'
            set -g @rose_pine_date_time '%a, %d %b'
            set -g @rose_pine_directory 'on'

            set -g @rose_pine_disable_active_window_menu 'on'

            set -g @rose_pine_right_separator ' '
            set -g @rose_pine_session_icon ''
            set -g @rose_pine_current_window_icon ''
            set -g @rose_pine_folder_icon ''
            set -g @rose_pine_username_icon '  '
            set -g @rose_pine_hostname_icon '  '
            set -g @rose_pine_date_time_icon ''
            set -g @rose_pine_window_status_separator "  "
            set -g @rose_pine_status_left_append_section ' '
          '';
        })
        (mkIf (cfg.theme == "catppuccin") {
          plugin = catppuccin;
          extraConfig = ''
            # Catppuccin config here ...
          '';
        })
        {
          plugin = yank;
          extraConfig = ''
            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
            bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

            bind-key -T copy-mode-vi m send-keys -X cursor-left
            bind-key -T copy-mode-vi n send-keys -X cursor-down
            bind-key -T copy-mode-vi e send-keys -X cursor-up
            bind-key -T copy-mode-vi i send-keys -X cursor-right
          '';
        }
        {
          plugin = tmux-fzf;
          extraConfig = ''
            TMUX_FZF_LAUNCH_KEY="f"
          '';
        }
        # {
        #   plugin = resurrect;
        # }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-save-interval "10"
            set -g @continuum-boot "on"
            # set -g @continuum-restore "on"
          '';
        }
      ];
    };
  };
}
