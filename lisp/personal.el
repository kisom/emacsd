;;; Various personal customisations.

;; reduce brain damage
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq display-time-24hr-format t)
(display-time-mode)

;; hippie-expand is the best
(require 'hippie-exp)
(require 'auto-complete)
(global-auto-complete-mode t)
(ac-set-trigger-key "<C-tab>")
(global-set-key (kbd "<C-tab>") 'ac-expand)

;; eshell is pretty okay
(global-set-key (kbd "C-x m") 'eshell)

;; ido-mode makes finding files way more awesome
;;    note: C-x C-f C-f will kick back to normal find-file for when ido's tab
;;    completion is getting in the way.
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
(global-set-key (kbd "C-c t u") 'k-insert-timestamp-tai)
(global-set-key (kbd "C-c t d") 'k-insert-date)
(global-set-key (kbd "C-c t y") 'k-insert-timestamp-yaklog) ;; yaklog timestamp

;; please to be not ruining pastes
(global-set-key (kbd "C-x p") 'fix-paste)

;; for writing blog posts and org docs
(global-set-key (kbd "C-x w") 'count-words)

;;; used with pollen
(global-set-key (kbd "C-c C-d")
		(lambda () (interactive) (insert "\u25ca")))
(add-to-list 'auto-mode-alist
	     '("\\.pm$" . text-mode))

;;; auto sexp formatting
(global-set-key (kbd "C-c C-l f") 'sexp-fmt)

(global-set-key (kbd "C-h u") 'woman)
(global-set-key (kbd "C-h U") 'woman-only)
(when window-system
  (setq woman-use-own-frame t))

(global-set-key (kbd "C-c f") 'k-indent-buffer)

;;; i like cua-rectangle
(cua-mode t)
(cua-selection-mode 'emacs)

;;; liberate the emacs os
(global-set-key (kbd "C-c b") 'surfraw)

;; view epubs as HTML directories
;; (setq auto-mode-alist
;;       (append (list '("\\.epub$" . archive-mode))
;; 	      auto-mode-alist))

;; (setq auto-coding-alist
;;       (append
;;        (list
;; 	'("\\.epub$" . no-conversion))
;;        auto-coding-alist))


;; goto-line faster
(global-set-key (kbd "C-c g") 'goto-line)

;;; Salt states should be treated as YAML, which works better for me
;;; than than the Salt major mode.
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

;;; infidel modes are those unclean modes that shouldn't have EOL
;;; whitespace-stripping done.
(defun infidel-mode-p ()
  (pcase major-mode
    (`fundamental-mode t)
    (_ nil)))

;;; nuke EOL-whitespace, unless we're in fundamental mode would should
;;; be left as-is.
(defun cleanup-buffer ()
  (unless (infidel-mode-p)
    (let ((delete-trailing-lines t))
      (save-excursion
	(delete-trailing-whitespace)))))

;;; not much use if we don't install this thing
(add-hook 'before-save-hook 'cleanup-buffer)
