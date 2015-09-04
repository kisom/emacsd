;;;; various utility functions

(defun time-delta-to-number (delta)
  (multiple-value-bind (sec-high sec-low microsec picosec) delta
    (+ (* (expt 2 16) sec-high)
       (float sec-low)
       (/ (float microsec) 1000000)
       (/ (float picosec)  1000000000))))

;; convert markdown links to org links, but also the other way because
;; some people just need their markdown
(defun markdown-link->org ()
  (interactive)
  (while (search-forward-regexp "\\[\\(.+?\\)\\](\\(.+?\\))")
    (replace-match (format "[[%s][%s]]" (match-string 2) (match-string 1)))))

(defun org->markdown-link ()
  (interactive)
  (while (search-forward-regexp "\\[\\[\\(.+?\\)\\]\\[\\(.+?\\)\\]\\]")
    (replace-match (format "[%s](%s)" (match-string 2) (match-string 1)))))

(defun k-insert-timestamp ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%H:%M:%S%z")))

(defun k-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun fix-paste ()
   (interactive)
   (save-excursion
     (beginning-of-buffer)
     (replace-string "“" "\"")
     (replace-string "”" "\"")
     (replace-string "’" "'")
     (replace-string "—" "---")
     (replace-string "- " "")
     (message "Paste fixed.")))

(defun update-initial-packages ()
  "Merge the current activated package list with those in the
initial packages list, and dump the new list to the end of the
initial-packages.el buffer for review."
  (load (format "%s../initial-packages.el" lisp-base))
  (find-file (format "%s../initial-packages.el" lisp-base))
  (goto-char (point-max))
  (if initial-package-list
      (progn
	(message "Updating package list.")
	(let ((merged-packages
	       (remove-duplicates
		(append
		 package-activated-list
		 initial-package-list))))
	  (insert (format "\n\n'(defvar initial-package-list\n(\n"))
	  (dolist (pkg actual-initial-packages)
	    (insert (format "\t%s\n" pkg)))
	  (insert (format "))\n"))))
    (message "No package list.")))

(defun sexp-fmt ()
  "Automatically format the "
  (interactive)
  (beginning-of-defun)
  (mark-sexp)
  (indent-pp-sexp))

(defun woman-only ()
  (interactive)
  (with-current-buffer (current-buffer)
    (save-excursion
      (woman)
      (delete-window))))
