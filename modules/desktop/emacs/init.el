(load "~/.config/emacs/themes/rose-pine-theme.el")
(load "~/.config/emacs/keymaps")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(set-fringe-mode 0)
(blink-cursor-mode -1)

(set-face-attribute 'default nil :family "JetBrainsMono NF" :height 110)
(add-to-list 'default-frame-alist '(font . "JetBrainsMono NF-11"))

;; Doom modeline
(doom-modeline-mode 1)

;; Which key
(which-key-mode)
(setq which-key-idle-delay 0.3)

;; Org
; (add-hook 'org-mode-hook #'org-modern-mode)
; (add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
(with-eval-after-load 'org (global-org-modern-mode))

; Auto-tangle the Org configuration
(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory)) 

(load-theme '${cfg.colorscheme} t)
