;;; This file contains configurations for various lisps.

;; don't load paredit until we load a lisp file.
(autoload 'enable-paredit-mode "paredit" t)

;;; Common Lisp

(require 'slime)
(add-hook 'common-lisp-mode #'enable-paredit-mode)


;;; ELisp

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
