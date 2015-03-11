;;; This file contains configurations for various lisps.

;; don't load paredit until we load a lisp file.
(require 'paredit)

;;; Common Lisp

(require 'slime)
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(add-hook 'common-lisp-mode #'enable-paredit-mode)


;;; ELisp

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)


;;; Clojure

(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'clojurescript-mode-hook #'enable-paredit-mode)
