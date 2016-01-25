(defun font-present-p (font families)
  (when (member font families) font))

(defun set-font (font &optional size)
  (let ((font (if size (format "%s-%d" font size) font)))
    (set-face-attribute 'default nil :font font)
    (set-frame-parameter nil 'font font)
    (set-face-attribute 'default nil :font font)))

(defun select-font ()
  (let ((ffam (font-family-list)))
    (or (font-present-p "Triplicate T4c" ffam)
	(font-present-p "Inconsolata" ffam)
	(font-present-p "Anonymous Pro" ffam)
	(font-present-p "Ubuntu Mono" ffam))))

(let ((font (select-font)))
  (when font
    (pcase (system-name)
      ("tessier" (set-font font 12))
      ("straka" (set-font font 11))
      ("straka-prime.local" (set-font font 12))
      (_ (set-font font)))))


;;; load custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
