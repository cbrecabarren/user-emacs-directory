(require 'php-mode)

(defun php-mode-default-config ()
  (setq before-save-hook nil)
)

(setq php-mode-config-hook 'php-mode-default-config)

(add-hook 'php-mode-hook (lambda () (run-hooks 'php-mode-config-hook)))
