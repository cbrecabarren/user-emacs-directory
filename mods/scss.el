(require 'scss-mode)

(defun scss-mode-default-config ()
  (setq scss-compile-at-save nil)
  (setq css-indent-level 2)
  (rainbow-mode)
)

(setq scss-mode-config-hook 'scss-mode-default-config)

(add-hook 'scss-mode-hook (lambda () (run-hooks 'scss-mode-config-hook)))
