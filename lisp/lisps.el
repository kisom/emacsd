;;; This file contains configurations for various lisps.

;; don't load paredit until we load a lisp file.
(require 'paredit)

;;; Common Lisp
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup '(slime-fancy))    ;adds some nice features
(load (expand-file-name "~/quicklisp/slime-helper.el"))

(require 'eldoc) ; if not already loaded
;; when moving backwards/forwards a sexp, update eldoc.
(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)

;; asd files need love too
(add-to-list 'auto-mode-alist
             '("\\.asd\\'" . (lambda ()
			       (common-lisp-mode)
			       (paredit-mode))))

;;; ELisp
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

;;; Clojure
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook #'enable-paredit-mode)
