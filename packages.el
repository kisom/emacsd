;;; This is a list of packages that are currently installed. This file
;;; should be compiled when the emacs lisp files are first loaded.

(require 'package)
(package-initialize)

;; get this package list with C-h v package-activated-list
(setq initial-package-list '(
			     bubbleberry-theme
			     cider
			     clojurescript-mode
			     dylan-mode epresent
			     flymake-haskell-multi
			     flymake-hlint
			     flymake-easy
			     ghc
			     ghci-completion
			     go-mode
			     haskell-mode
			     hippie-expand-haskell
			     kibit-mode
			     clojure-mode
			     magit
			     git-rebase-mode
			     git-commit-mode
			     markdown-mode
			     merlin
			     mode-compile
			     niclein
			     org-ac
			     auto-complete-pcmp
			     log4e
			     auto-complete
			     org-beautify-theme
			     org-journal
			     org-pandoc
			     org-present
			     org-presie
			     eimp
			     framesize
			     key-chord
			     org-projectile
			     org-wc
			     orgbox
			     ox-reveal
			     org
			     paredit
			     popup
			     projectile
			     pkg-info
			     epl
			     queue
			     rainbow-delimiters
			     scpaste
			     shadchen
			     slamhound
			     slime
			     slime-theme
			     smartparens
			     dash
			     sublime-themes
			     caml
			     transpose-frame
			     tronesque-theme
			     tuareg
			     undo-tree
			     utop
			     w3m
			     yaxception
))

(add-to-list 'package-archives
   '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
   '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)

(dolist (package initial-package-list)
  (unless (package-installed-p package)
    (package-install package)))



