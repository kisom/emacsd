;; Load my personal Lisp files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; set up package handling
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(require 'cl-lib)

(let ((startup-time (current-time)))
  (setq inhibit-startup-echo-area-message
	"kyle")
  (setq lisp-base "~/.emacs.d/lisp/")
  (setq lisp-files '("custom.el"    ; first, load customized-*
		     "display.el"   ; get your cool looks on
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

  ;; load the lisp files
  (mapcar #'load
	  (mapcar (lambda (el)
		    (concat lisp-base el))
		  lisp-files))

  ;; load scriba from contrib
  (load "~/.emacs.d/contrib/scriba.el")

  (if 'window-system
      (load-theme 'slime)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "blue" "brightmagenta" "cyan" "white"])
 '(ansi-term-color-vector
   [unspecified "black" "red" "green" "yellow" "blue" "brightmagenta" "cyan" "white"] t)
 '(custom-safe-themes
   (quote
    ("fdf146f6131bd4166520601118d6833db1f1e7bde14fc40c7ba2f41e47041a2a" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "2b56bd7a702f4dd5f50db417ec2bcdd06a878a0e2834e9ab37ad3c5c93aaab74" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" default)))
 '(gofmt-command "goimports")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(linum-format " %7i ")
 '(package-selected-packages
   (quote
    (disaster discover rust-mode rustfmt xcscope company-go company-cabal company-c-headers company c-eldoc auto-complete-clang ample-zen-theme ample-theme ac-c-headers yaml-mode w3m utop undo-tree tuareg tronesque-theme transpose-frame sublime-themes slime-theme slime slamhound scpaste rainbow-delimiters paredit ox-reveal orgbox org-wc org-projectile org-presie org-present org-pandoc org-journal org-jira org-beautify-theme org-ac niclein merlin markdown-mode magit kibit-mode jira irfc hippie-expand-haskell hindent hi2 go-mode gist ghci-completion ghc flymake-hlint flymake-haskell-multi flycheck-haskell epresent ebal dylan-mode clojurescript-mode cider caskxy cask bubbleberry-theme ag 0blayout)))
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
