(require 'paredit)

(dolist (mode '(scheme emacs-lisp lisp clojure))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
	    (lambda ()
	      (paredit-mode t))))
