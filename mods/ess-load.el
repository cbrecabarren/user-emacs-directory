;; load ess

(add-to-list 'load-path (concat user-emacs-directory "vendor/ess/lisp"))

(defun ess-load ()
  "Load ESS (emacs speaks statistics)"
  (interactive)
  (require 'ess-site))
