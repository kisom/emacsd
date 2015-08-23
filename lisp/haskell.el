;;; configuration for Haskell

(require 'haskell-mode)

 ;; docs are good
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

 ;; get rid of that annoying popup
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; interaction is good
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
