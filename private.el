;; This is your private configuration file. It is loaded automatically, so feel free to add whatever you want.
;; This file will not be affected by Castlemacs updates.

;; initial window size
(setq initial-frame-alist
      '(
        (width . 120) ; character
        (height . 64) ; lines
        ))

;; default/sebsequent window size
(setq default-frame-alist
      '(
        (width . 120) ; character
        (height . 62) ; lines
        ))

;; set default font
(set-face-attribute 'default nil
                    :family "iA Writer Duospace"
                    :height 141
                    :weight 'normal
                    :width 'normal)

;; dashboard
(dashboard-setup-startup-hook)
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents  . 20)
			(bookmarks . 5)))
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-center-content t)

(add-to-list 'auto-mode-alist '("\\.mdh\\'" . markdown-mode))

;; markdown writing environment
(add-hook 'markdown-mode-hook (lambda ()
				  (pandoc-mode)
          (flyspell-buffer)
          (olivetti-mode t)
          (set-face-attribute 'fringe nil :background nil)
				  (olivetti-set-width 80)))

;; pandoc mode

(setq pandoc-process-connection-type nil)

;; theme
;;(load-theme 'sanityinc-tomorrow-eighties)
;;(global-hl-line-mode -1)

;; use count-words instead of count-words-region as it works on buffer
;; if no region is selected
(global-set-key (kbd "M-=") 'count-words)

;; dired

(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; neotree

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; bibtex completer
(setq bibtex-completion-bibliography
      '("/Users/robi/Dropbox/Pandocfiles/zotero.bib"))
(setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)
(global-set-key (kbd "C-c C-x b") 'ivy-bibtex)
