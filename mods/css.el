(require 'css-mode)

(defun css-mode-default-config ()
  (setq css-indent-level 2)
  (rainbow-mode)
)

(setq css-mode-config-hook 'css-mode-default-config)

(add-hook 'css-mode-hook (lambda () (run-hooks 'css-mode-config-hook)))
