;; sets custom user directory
(setq user-emacs-directory "/home/cbeltranr/build/emacs-git/user-emacs-directory/")

;; Turn off mouse interface early in startup to avoid momentary display
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; repositories
(require 'package)
(add-to-list 'package-archives
	     '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; sets customization file
(setq custom-file (concat user-emacs-directory "custom.el"))

;; plugins path
(add-to-list 'load-path (concat user-emacs-directory "plugins/"))

;; global font lock mode for syntax highlighting
(global-font-lock-mode 1)

;; auto reload buffers from files changed in disk
(global-auto-revert-mode)

;; ido-mode
(require 'ido)
(ido-mode t)

;; cua-mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)  ;; Don't tabify after rectangle commands
(transient-mark-mode 1)                ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t)    ;; Standard Windows behaviour

;; use shift to select text
;; (pc-selection-mode)

;; delete selection mode
(delete-selection-mode t)

;; show line numbers
(global-linum-mode 1)
(setq linum-format "%4d ")

;; buffer name in title bar
(setq frame-title-format "%b - emacs24")

;; backup and autosave files
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; scroll
(setq scroll-step 1)
(setq mouse-wheel-scroll-amount '(2))
(setq mouse-wheel-progressive-speed nil)

;; rhtml mode
(add-to-list 'load-path (concat user-emacs-directory "plugins/rhtml/"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
     	  (lambda () (rinari-launch)))

;; erlang mode
(add-to-list 'load-path (concat user-emacs-directory "plugins/erlang"))
(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; current line highlighting
(global-hl-line-mode)

;; stops selection with a mouse being immediately injected to the kill ring
(setq mouse-drag-copy-region nil)

;; C mode
(setq c-default-style "k&r")
(setq-default c-basic-offset 4)


;; yasnippet
(add-to-list 'load-path (concat user-emacs-directory "plugins/yasnippet/"))
(require 'yasnippet)
(setq yas/trigger-key "C-TAB")
(setq yas/snippet-dirs (concat user-emacs-directory "my_snippets/"))
(yas/global-mode 1)
;; snippet directories
(yas/load-directory yas/snippet-dirs)
(yas/load-directory (concat user-emacs-directory "plugins/yasnippet/snippets/"))
;; trigger key
(custom-set-variables '(yas/trigger-key "<C-tab>"))
;; load snippets
;; (yas/load-directory "~/.emacs.d/plugins/yasnippets-rails/rails-snippets/")
;; (yas/load-directory "~/.emacs.d/plugins/textmate-snippets/")


;; fullscreen
(require 'fullscreen)

;; disable tool bar
(tool-bar-mode -1)
;; disable menu bar
(menu-bar-mode -1)
;; scroll bar
;; (scroll-bar-mode -1)
(scroll-bar-mode (quote right))

(mouse-wheel-mode t)
(blink-cursor-mode -1)

;; highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(setq visible-bell t)
(setq inhibit-startup-message t)
(setq diff-switches "-u")

(defalias 'yes-or-no-p 'y-or-n-p)

(set-default 'cursor-type 'bar)

;; mods
(defvar mods-dir (concat user-emacs-directory "mods/"))
(when (file-exists-p mods-dir)
  (mapc 'load-file (directory-files mods-dir t "^[^#].*el$")))


;; loads customization file
(load custom-file 'noerror)

;; color theme
(add-to-list 'load-path (concat user-emacs-directory "plugins/color-theme-6.6.0/"))
(require 'color-theme)
(setq color-theme-is-global t)
;; load themes
(load-file (concat user-emacs-directory "themes/color-theme-railscasts/color-theme-railscasts.el"))
(load-file (concat user-emacs-directory "themes/color-theme-ir-black/color-theme-ir-black.el"))
(load-file (concat user-emacs-directory "themes/color-theme-cbrecabarren/color-theme-cbrecabarren.el"))
;; set up default themes
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (if window-system
	 (color-theme-cbrecabarren)
       (color-theme-ir-black))     
     ))
