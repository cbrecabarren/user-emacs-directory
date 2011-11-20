;; auto load
(progn
  (eval-after-load 'ruby-mode
    '(progn
       (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
       )))


(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

(require 'ruby-end)
(add-hook 'ruby-mode-hook (lambda () (ruby-end-mode t)))

;; ruby auto mode
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
