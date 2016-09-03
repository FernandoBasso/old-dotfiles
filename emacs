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

;; Problems with (global-linum-mode 1). Let's not use fancy utf8 char for now.
;(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(setq org-src-window-setup 'current-window)

(setq org-agenda-files '("~/Dropbox/orgmode"))

(setq org-edit-src-content-indentation 0)

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

;; It is causing problems with org-ellipsis set to ⤵ .
;(global-linum-mode 2)

(setq backup-directory-alist `(("." . "~/Emacs_Stuff")))
(setq frame-title-format "%b")
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-set-key "\C-c\d" 'previous-buffer)

(setq split-height-threshold 80)
(setq split-width-threshold 160)


(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default tab-always-indent 'complete)


(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq fill-column 78)


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
 '(org-code ((t (:inherit shadow :foreground "dark green")))))



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





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "7790dbc91156dd9a5c7f2ee99e5f7e6549f244038b46ed6352d7693be2e0aec6" "ef04dd1e33f7cbd5aa3187981b18652b8d5ac9e680997b45dc5d00443e6a46e3" "25c242b3c808f38b0389879b9cba325fb1fa81a0a5e61ac7cae8da9a32e2811b" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" default))))
