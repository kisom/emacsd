;;; This is a list of packages that are currently installed. This file
;;; should be compiled when the emacs lisp files are first loaded.

(require 'cl)
(require 'package)
(package-initialize)

(defun andl (lst)
  "Apply the #'and function to a list of truth values."
  (reduce (lambda (a b)
	    (and a b))
	  lst))

(defun orl (lst)
  "Apply the #'or function to a list of truth values."
  (reduce (lambda (a b)
	    (or a b))
	  lst))

(defun marmalade-set-p ()
  (orl
   (mapcar (lambda (repo)
	     (string-equal (car repo) "marmalade"))
	   package-archives)))

(setq initial-package-list
      '("flymake-haskell-multi"
	"flymake-hlint"
	"ghc"
	"ghci-completion"
	"haskell-mode"
	"hippie-expand-haskell"
	"sublime-themes"
	"tronesque"
	"magit"
	"paredit"
	"slime"
	"undo-tree"
	"rainbow-delimiters"))

(defun bootstrap-packages ()
  (unless (marmalade-set-p)
    (add-to-list 'package-archives
		 '("marmalade" . "http://marmalade-repo.org/packages/")))
  (package-refresh-contents)
  (mapcar #'package-install 
	  (mapcar #'make-symbol initial-package-list)))

(bootstrap-packages)



