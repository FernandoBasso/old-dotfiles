
;; Let's just use spaces.
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
;; (setq indent-line-function 'insert-tab)

;;
;; Quicklisp, SLIME
;;
(load (expand-file-name "~/bin/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;;("quicklisp-slime-helper")


(blink-cursor-mode -1)
;;(set-default-font "monofur-14")
;;(set-default-font "Anonymous Pro Minus 12")
;;(set-default-font "Courier 10 Pitch")
;;(set-default-font "Monaco 10")
;;(set-default-font "Lucida Console")
;;(set-default-font "ubuntu mono 13")
;;(set-default-font "Liberation Mono-11")
(set-default-font "Source Code Pro")

(global-linum-mode 1)

(setq backup-directory-alist `(("." . "~/Emacs_Stuff")))
(setq frame-title-format "%b")
(tool-bar-mode -1)
(menu-bar-mode -1)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

  '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))

  '(browse-url-browser-function (quote browse-url-generic)))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org mode

(setq org-emphasis-regexp-components
      '("     ('\"{“”"
        "-   .,!?;''“”\")}/\\“”"
        "    \r\n"
        "."
        1))

(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode t)))

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(setq org-src-window-setup 'current-window)


(add-hook 'after-save-hook
          (lambda ()
            (let* ((filename (buffer-file-name))
                   (ext (file-name-extension filename)))
              (if (equal ext "adoc")
                (shell-command (format "asciidoctor %s" 
                                       (shell-quote-argument filename))
                               nil
                               "*asciidoc-errors*")))))



;; yasnippet
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

