;;; This is a list of packages that are currently installed. This file
;;; should be compiled when the emacs lisp files are first loaded.

(require 'package)
(package-initialize)

(setq initial-package-list '(
	flymake-haskell-multi
	flymake-hlint
	ghc
	ghci-completion
	haskell-mode
	hippie-expand-haskell
	sublime-themes
	tronesque-theme
	magit
	paredit
	slime
	undo-tree
	rainbow-delimiters
	scpaste
	dylan-mode
	slime-theme
))

(add-to-list 'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
   '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)
(dolist (package initial-package-list)
   (package-install package))



