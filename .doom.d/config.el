;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Bruno Robert"
      user-mail-address "bruno.jeanluke@icloud.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(require 'rust-mode)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ===============
;; Bruno's config
;; ===============
;; maximize the window upon startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; All this configures the python auto complete with elpy
;; It also allows me to run a python file with 'C-c C-c'
;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable)
;;   )
;; (setq elpy-rpc-virtualenv-path "~/Environments/emacs_main/")
;; (setq elpy-rpc-python-command "python")
;; (setq python-shell-interpreter "python") ;; This is what `C-c C-c` will use

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

;; md-roam and org-roam

;; (use-package! md-roam ; load immediately, before org-roam
;;   :config
;;   (setq md-roam-file-extension-single "md"))
    ;you can omit this if md, which is the default.

;; (use-package org-roam
;;       :ensure t
;;       :hook
;;       (after-init . org-roam-mode)
;;       :custom
;;       (org-roam-directory "~/pCloud Syncs/Org")
;;       :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-graph))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))
;;               (("C-c n I" . org-roam-insert-immediate))))

(setq org-roam-directory "~/pCloud Syncs/Org")

;; ==== Bindings =====

;; window movement
(map! "s-<up>"    #'windmove-up
      "s-<right>" #'windmove-right
      "s-<left>"  #'windmove-left
      "s-<down>"  #'windmove-down)

;; lsp bindings
(map! :leader
  (:prefix ("l" . "lang")
  (:prefix ("g" . "Go to")
    :desc "Implementation"            "i" #'lsp-goto-implementation
    :desc "Definition"                "d" #'lsp-goto-type-definition)
  (:prefix ("f" . "Find")
    :desc "Definition"                "d" #'lsp-find-definition
    :desc "References"                "r" #'lsp-find-references)
  (:prefix ("l" . "Lens")
    :desc "Show"                      "l" #'lsp-lens-show
    :desc "Hide"                      "q" #'lsp-lens-hide)
  (:prefix ("m" . "menu")
    :desc "Show"                      "m" #'lsp-ui-imenu
    :desc "Hide"                      "q" #'lsp-ui-imenu--kill)))
