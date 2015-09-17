(require 'go-mode)

(unless (getenv "GOPATH")
  (setenv "GOPATH" (getenv "HOME")))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;;;
(unless (executable-find "gocode")
  (shell-command-to-string "go get github.com/nsf/gocode"))
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook 'eldoc-mode)

