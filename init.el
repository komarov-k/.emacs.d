;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 	Emacs Configuration
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1. Turn off welcome screen...
(setq inhibit-startup-screen t) ;; don't show welcome screen

;; 2. Turn off file/edit/etc. menu header...
(menu-bar-mode -1)

;; 3. Turn off default help/welcome message...
(defun display-startup-echo-area-message () (message ""))

;; 4. Turn off shell line truncation...
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))

;; 5. macOS stuff...
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 6. Turn off line truncating
(set-default 'truncate-lines t)

;; 7. Keep tempfiles in a dedicated directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5)   ; and how many of the old

;; 8. Use SSH connection in TRAMP mode (because its faster) ...
(setq tramp-default-method "ssh")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;	Include external package archives...	
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives ;; Add MELPA archive...
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;	Auto-generated (DO NOT EDIT!!!)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e"
     default)))
 '(package-selected-packages
   (quote
    (multiple-cursors
     highlight-symbol
     mode-icons
     smart-mode-line
     cmake-font-lock
     all-the-icons
     neotree
     monokai-theme
     fireplace
     jedi
     projectile
     editorconfig)))
 '(symon-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;	Configure 3rd party
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1. Neotree configuration...

(setq neo-theme (if (display-graphic-p) 'icons 'icons))
(global-set-key [f8] 'neotree-toggle) ;; togle with F8

;; 2. Smart-mode-line

(setq sml/no-confirm-load-theme t)
(setq sml/mode-width "full")
(setq sml/theme 'respectful)
(line-number-mode 1)
(column-number-mode 1)
(sml/setup)

;; 3. Highligh-Symbol configuration...

(global-set-key (kbd "C-h s") 'highlight-symbol)
;;(global-set-key [(control f1)] 'highlight-symbol-next)
;;(global-set-key [(control f1)] 'highlight-symbol-prev)
;;(global-set-key (kbd "M-h H")] 'highlight-symbol-query-replace)
(global-set-key (kbd "C-h C-s") 'highlight-symbol-nav-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;	Color theme setup...
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-theme 'monokai t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;	Open emacs in Projectile
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(projectile-mode)
