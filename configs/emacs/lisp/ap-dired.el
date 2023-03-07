(setup dired
  (:require dired-x)
  (:option dired-listing-switches "-lahX --group-directories-first"
	   dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
  (:hook dired-hide-details-mode
	 dired-omit-mode
	 hl-line-mode)
  (:bind-into dired-mode-map
    "h" dired-omit-mode))

(setup (:package diredfl)
  (:option diredfl-global-mode t))

(setup (:package dired-subtree)
  (:bind-into dired-mode-map
    "TAB" dired-subtree-toggle))

(provide 'ap-dired)
