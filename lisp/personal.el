;;; Various personal customisations.

 ;; set up package handling
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

 ;; reduce brain damage
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)

 ;; hippie-expand is the best
(require 'hippie-exp)
(global-set-key (kbd "<C-tab>") 'hippie-expand)

 ;; eshell is pretty okay
(global-set-key (kbd "C-x m") 'eshell)

;; ido-mode makes finding files way more awesome
(require 'ido)
(ido-mode 1)

;; magit, not yours
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; undo-tree is undo done right
(require 'undo-tree)
(global-undo-tree-mode)

;; i like refilling paragraphs
(global-set-key (kbd "M-q") 'fill-paragraph)

;; i install things to /usr/local
(setq exec-path (append exec-path '("/usr/local/bin")))

;; tell me where i'm at
(column-number-mode)

;; ansi-term is sometimes more useful than eterm
(global-set-key (kbd "C-x t")
		(lambda () (interactive)
		  (ansi-term "/bin/bash")))

