(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode


(setq org-emphasis-regexp-components
      '("     ('\"{“”"
        "-   .,!?;''“”\")}/\\“”:"
        "    \r\n"
        "."
        1))

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(setq org-src-window-setup 'current-window)

(setq org-agenda-files '("~/Dropbox/orgmode"))

;; bigger latex fragment
(require 'org)
(plist-put org-format-latex-options :scale 1.5)


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Languages that will be supported to evaluate (C-c C-c) in code blocks.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (haskell . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-hide-emphasis-markers t)

(defun my/toggle-org-hide-emphasis-markers ()
  "Toggle displaying of org-mode markers like ~, * and /, among others."
  (interactive)
  (when (eq major-mode 'org-mode)
    (setq org-hide-emphasis-markers (not org-hide-emphasis-markers))
    (message "%s org-mode-emphasis-markers" (if org-hide-emphasis-markers "Showing" "Hiding"))
    (org-mode)))

(global-set-key (kbd "C-c t") 'my/toggle-org-hide-emphasis-markers)

; (defun export-to-utf8-text ()
;   "Export .org file to utf8 text"
;   (org-ascii-export-to-ascii))

;(add-hook 'org-mode-hook
;          (lambda ()
;            (add-hook 'after-save-hook 'export-to-utf8-text nil 'make-it-local)))





;; Let's just use spaces.
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
;; (setq indent-line-function 'insert-tab)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Quicklisp, SLIME
;;
(load (expand-file-name "~/bin/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;("quicklisp-slime-helper")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other Settings
;;
(blink-cursor-mode -1)
(set-default-font "Ubuntu Mono 13")

(setq show-trailing-whitespace t)
(setq delete-trailing-lines nil)



;; Restore cursor position
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

(setq inhibit-startup-screen t)

(global-linum-mode 1)

(setq backup-directory-alist `(("." . "~/Emacs_Stuff")))
(setq frame-title-format "%b")
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-set-key "\C-c\d" 'previous-buffer)

(setq split-height-threshold 80)
(setq split-width-threshold 160)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(custom-safe-themes
   (quote
    ("cfa7053f155661faa33ef648f55d524eb97854f8f0ff9ff91a08b3ba47a9a25f" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "midori")


;;
;; Makes CLHS work from a local copy.
;;
(load "/home/fernando/bin/quicklisp/clhs-use-local.el" t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(add-hook 'after-save-hook
          (lambda ()
            (let* ((filename (buffer-file-name))
                   (ext (file-name-extension filename)))
              (if (equal ext "adoc")
                (shell-command (format "asciidoctor %s"
                                       (shell-quote-argument filename))
                               nil
                               "*asciidoc-errors*")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; haskell-mode
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)





