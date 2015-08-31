;; Load my personal Lisp files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((startup-time (current-time)))
  (setq inhibit-startup-echo-area-message
	"kyle")
  (setq lisp-base "~/.emacs.d/lisp/")
  (setq lisp-files '("custom.el"    ; first, load customized-*
		     "util.el"      ; load any utilities needed
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

  ;; load scriba from contrib
  (load "~/.emacs.d/contrib/scriba.el")

  (load-theme 'bubbleberry)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "afc220610bee26945b7c750b0cca03775a8b73c27fdca81a586a0a62d45bbce2" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "869b11b64da20b6b04e9b18721e03a58e5d9f0ee3a7a91bfe7cdc2b24a828109" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
(put 'downcase-region 'disabled nil)
