(defun go-mode-default-config ()
  (setq tab-width 4 indent-tabs-mode 1)
)

(add-hook 'go-mode-hook 'go-mode-default-config)
