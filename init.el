;;; Load my personal Lisp files.

(setq lisp-base "~/.emacs.d/lisp/")
(setq lisp-files '("custom.el"    ; first, load customized-*
                   "personal.el"  ; any high-level customisations
		   "haskell.el"   ; fun with haskell-mode
                   "lisps.el"     ; lisp activations for great success
		   "scpaste.el"   ; scpaste is great for sharing things
		   "dylan.el"     ; need some dylan
))

(mapcar #'load
	(mapcar (lambda (el)
		  (concat lisp-base el))
		lisp-files))

(unless (null window-system)
  (load-theme 'brin))
