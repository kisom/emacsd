;;; configuration for Haskell

(require 'haskell-mode)

 ;; docs are good
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

 ;; get rid of that annoying popup
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation) 
