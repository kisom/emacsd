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
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-set-trigger-key "<C-tab>")
(global-set-key (kbd "<C-tab>") 'ac-expand)

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
(add-to-list 'exec-path "/usr/local/bin")

;; tell me where i'm at
(column-number-mode)

;; ansi-term is sometimes more useful than eterm
(global-set-key (kbd "C-x t")
		(lambda () (interactive)
		  (ansi-term "/bin/bash")))

;; sometimes you just wanna (╯° °）╯︵ ┻━┻) but with frames
(require 'transpose-frame)
(global-set-key (kbd "C-c C-s") 'flip-frame)
(global-set-key (kbd "C-c C-f") 'flop-frame)

;; matching delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; code-b-gone
(global-set-key (kbd "C-c C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)

;; the timestamping functions are in util.el
(global-set-key (kbd "C-c t t") 'k-insert-timestamp)
(global-set-key (kbd "C-c t d") 'k-insert-date)

;; i read the instructions all right
(setq magit-last-seen-setup-instructions "1.4.0")

(defun fix-paste ()
   (interactive)
   (save-excursion
     (beginning-of-buffer)
     (replace-string "“" "\"")
     (replace-string "”" "\"")
     (replace-string "’" "'")
     (replace-string "—" "---")
     ;(replace-string "  " " ")
     (replace-string "- " "")
     (message "Paste fixed.")))

(global-set-key (kbd "C-x p") 'fix-paste)
