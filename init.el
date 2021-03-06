;; Load my personal Lisp files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; set up package handling
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(require 'cl-lib)

;;; set up the install paths for programs
;; i install things to /usr/local
(add-to-list 'exec-path "/usr/local/bin")

;; and i keep personal bins in ~/bin
(add-to-list 'exec-path "/home/kyle/bin")

(let ((startup-time (current-time)))
  (setq inhibit-startup-echo-area-message
	"kyle")
  (setq lisp-base "~/.emacs.d/lisp/")
  (setq lisp-files '("display.el"   ; get your cool looks on
		     "util.el"      ; load any utilities needed
		     "surfraw.el"   ; better browsing
		     "personal.el"  ; any high-level customisations
		     "enabled.el"   ; turn on any default-disabled functions
		     "c.el"         ; for maximum fun
		     "haskell.el"   ; fun with haskell-mode
		     "lisps.el"     ; lisp activations for great success
		     "scpaste.el"   ; scpaste is great for sharing things
		     "dylan.el"     ; need some dylan
		     "go.el"        ; go go go!
		     ))

  (setq custom-file "~/.emacs.d/lisp/custom.el")
  (load custom-file)

  ;; load the lisp files
  (mapcar #'load
	  (mapcar (lambda (el)
		    (concat lisp-base el))
		  lisp-files))
  
  ;; load scriba from contrib
  (load "~/.emacs.d/contrib/scriba.el")

  ;; load gforth from contrib
  (load "~/.emacs.d/contrib/gforth.el")

  (if 'window-system
      (load-theme 'eink-light)
    (progn
      (setq-default global-font-lock-mode nil)))

  ;; set eshell path after exec-path is finalised
  (setenv "PATH"
	  (mapconcat (lambda (dir)
		       (or dir "."))
		     exec-path
		     path-separator))

  (message (format "Start up time: %0.3f ms"
		   (* 1000
		      (time-delta-to-number
		       (time-subtract
			(current-time)
			startup-time))))))
