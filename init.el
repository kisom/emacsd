;;; Load my personal Lisp files.

(let ((startup-time (current-time)))
  (setq inhibit-startup-echo-area-message
	"kyle")
  (setq lisp-base "~/.emacs.d/lisp/")
  (setq lisp-files '("custom.el"    ; first, load customized-*
		     "personal.el"  ; any high-level customisations
		     "haskell.el"   ; fun with haskell-mode
		     "lisps.el"     ; lisp activations for great success
		     "scpaste.el"   ; scpaste is great for sharing things
		     "dylan.el"     ; need some dylan
		     "go.el"        ; go go go!
		     ))

  ;; load the lisp files
  (mapcar #'load
	  (mapcar (lambda (el)
		    (concat lisp-base el))
		  lisp-files))

  (load-theme 'slime)

  ;; set eshell path after exec-path is finalised
  (setenv "PATH"
	  (mapconcat (lambda (dir)
		       (or dir "."))
		     exec-path
		     path-separator))

  (message (concat
	    "Start up time: "
	    (format-time-string "%3N" 
				(time-subtract
				 (current-time)
				 startup-time))
	    "ms")))

