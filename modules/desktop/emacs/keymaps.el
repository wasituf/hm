;; Create leader key
(general-create-definer leader
  :prefix "SPC")

;; Define general keymaps
(general-define-key
 :states '(normal visual)
 "m" 'evil-backward-char
 "n" 'evil-next-line
 "e" 'evil-previous-line
 "i" 'evil-forward-char
 "h" 'evil-insert
 "l" 'evil-forward-word-end)

;; Window navigation
(general-define-key
 :states '(normal visual)
 "M-m" 'evil-window-left
 "M-n" 'evil-window-down
 "M-e" 'evil-window-up
 "M-i" 'evil-window-right)

;; Scrolling and buffer navigation
(general-define-key
 :states '(normal visual)
 "C-n" 'evil-scroll-down
 "C-e" 'evil-scroll-up
 "I" 'next-buffer
 "M" 'previous-buffer)
