
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq inhibit-startup-message t)
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;;Disable bars
(tool-bar-mode -1)
 
(use-package zerodark-theme
  :ensure t)
(setq custom-safe-themes t)
(load-theme 'zerodark t)

;;Does anyone type yes anymore?
(fset 'yes-or-no-p 'y-or-n-p)

(setq ido-enable-flex-matching t)

;;undo-redo
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  :config
  (defalias 'redo 'undo-tree-redo)
  :bind (("C-z" . undo)     ; Zap to character isn't helpful
         ("C-S-z" . redo)))

;;switching windows
(use-package ace-window
  :ensure t
  :init
    (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l ?o))
    (global-set-key (kbd "C-x o") 'ace-window)
  :diminish ace-window-mode)

(use-package auto-complete
  :ensure t
  :init
    (global-auto-complete-mode t)
)

(use-package linum-relative
  :ensure t
  :init	       
     (global-set-key (kbd "C-c l") 'linum-relative)
)  

(use-package expand-region
  :ensure t
  :init
    (global-set-key (kbd "C-=") 'er/expand-region)
)

(use-package multiple-cursors
  :ensure t
  :init
    (global-set-key (kbd "C-.") 'mc/mark-next-like-this)
    (global-set-key (kbd "C->") 'mc/mark-all-like-this)		
)

(use-package ace-jump-mode
  :ensure t
  :init
    (define-key global-map (kbd "C-,") 'ace-jump-word-mode)
    (define-key global-map (kbd "C-<") 'ace-jump-mode-pop-mark)
)

(use-package smart-comment     
  :ensure t
  :init
    (global-set-key (kbd "M-;") 'smart-comment)
)

(use-package magit
  :ensure t
  :init
    (global-set-key (kbd "C-x g") 'magit-status)
)

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
)
(use-package org-pdfview
  :ensure t)


;; Start off emacs server, so that `emacsclient` can be used
(load "server")
(if (server-running-p)
    (message "%s" "Server already started;)")
  (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-pdfview php-mode ## pdf-tools zerodark-theme use-package undo-tree smart-comment multiple-cursors linum-relative kooten-theme gruber-darker-theme expand-region dracula-theme color-theme-sanityinc-tomorrow color-theme auto-complete ace-window ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

