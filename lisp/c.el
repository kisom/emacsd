;;;; c.el
;;; let's try to make emacs work for C code.



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

