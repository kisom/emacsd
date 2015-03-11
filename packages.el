;;; This is a list of packages that are currently installed. This file
;;; should be compiled when the emacs lisp files are first loaded.

(require 'package)
(package-initialize)

;; get this package list with C-h v package-activated-list
(setq initial-package-list '(
			     cider
			     clojure-mode
			     clojurescript-mode
			     dash
			     dylan-mode
			     flymake-haskell-multi
			     flymake-hlint
			     flymake-easy
			     ghc
			     ghci-completion
			     go-mode
			     haskell-mode
			     hippie-expand-haskell
			     magit
			     git-rebase-mode
			     git-commit-mode
			     paredit
			     queue
			     rainbow-delimiters
			     scpaste
			     slime
			     slime-theme
			     sublime-themes
			     transpose-frame
			     tronesque-theme
			     undo-tree
))

(add-to-list 'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
   '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)

(dolist (package initial-package-list)
  (unless (package-installed-p package)
    (package-install package)))



