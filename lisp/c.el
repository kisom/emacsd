;;;; c.el
;;; let's try to make emacs work for C code.


;;; from Chris Neukirchen's .emacs
;;;     http://chneukirchen.org/dotfiles/.emacs
(defun new-c-lineup-arglist (langelem)
  (save-excursion
    (goto-char (cdr langelem))
    (setq syntax (car (car (c-guess-basic-syntax))))
    (while (or (eq syntax 'arglist-intro)
               (or (eq syntax 'arglist-cont)
                   (eq syntax 'arglist-cont-nonempty)))
      (forward-line -1)
      (setq syntax (car (car (c-guess-basic-syntax)))))
    (beginning-of-line)
    (re-search-forward "[^ \t]" (c-point 'eol))
    (goto-char (+ (match-beginning 0) 4))
    (vector (current-column))))

;;; from Chris Neukirchen's .emacs
;;;     http://chneukirchen.org/dotfiles/.emacs
(c-add-style "openbsd"
             '("bsd"
               (c-ignore-auto-fill . '(string))
               (c-subword-mode . 0)
               (c-basic-offset . 8)
               (c-label-minimum-indentation . 0)
               (c-offsets-alist .
                                ((arglist-intro . new-c-lineup-arglist)
                                 (arglist-cont . new-c-lineup-arglist)
                                 (arglist-cont-nonempty . new-c-lineup-arglist)
                                 (arglist-close . 0)
                                 (substatement-open . 0)
                                 (statement-cont . *)
                                 (case-label . 0)
                                 (knr-argdecl . *)))
               (fill-column . 80)
               (tab-width . 8)
               (indent-tabs-mode . t)))

(setq c-default-style "openbsd")
(add-hook 'c-mode 'cscope-minor-mode)
(require 'xcscope)
(cscope-setup)


(defun k-compile-interactive ()
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'recompile))

(global-set-key (kbd "C-x c") 'k-compile-interactive)


(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
