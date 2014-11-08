(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(tool-bar-mode -1)
(menu-bar-mode -1)


;;; Load my personal Lisp files.

(setq lisp-base "~/.emacs.d/lisp/")
(setq lisp-files '("custom.el"    ; first, load customized-*
                   "personal.el"  ; any high-level customisations
		   "haskell.el"   ; fun with haskell-mode
                   "lisps.el"     ; lisp activations for great success
))

(mapcar #'load
	(mapcar (lambda (el)
		  (concat lisp-base el))
		lisp-files))

(load-theme 'wombat)

