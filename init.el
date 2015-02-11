;;; Load my personal Lisp files.

(setq lisp-base "~/.emacs.d/lisp/")
(setq lisp-files '("custom.el"    ; first, load customized-*
                   "personal.el"  ; any high-level customisations
		   "haskell.el"   ; fun with haskell-mode
                   "lisps.el"     ; lisp activations for great success
		   "scpaste.el"   ; scpaste is great for sharing things
		   "dylan.el"     ; need some dylan
))

(mapcar #'load
	(mapcar (lambda (el)
		  (concat lisp-base el))
		lisp-files))

(load-theme 'brin)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes (quote ("58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "bac3f5378bc938e96315059cd0488d6ef7a365bae73dac2ff6698960df90552d" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "869b11b64da20b6b04e9b18721e03a58e5d9f0ee3a7a91bfe7cdc2b24a828109" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
