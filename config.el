;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! :leader
      "SPC" nil
      :desc "M-x" "SPC" #'execute-extended-command)
(map! :leader
      :desc "Comment line"   "c l" #'comment-line
      :desc "Comment region" ";"   #'comment-dwim)
;; ;; potentially not needed
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '((python-mode python-ts-mode)
;;                  "basedpyright-langserver" "--stdio")))


(map! :leader
      :desc "Window left"  "w h" #'evil-window-left
      :desc "Window down"  "w j" #'evil-window-down
      :desc "Window up"    "w k" #'evil-window-up
      :desc "Window right" "w l" #'evil-window-right
      :desc "Next window"     "w TAB" #'evil-window-next
      :desc "Previous window" "w S-TAB" #'evil-window-prev

      :desc "Split vertical"   "w /" #'evil-window-vsplit
      :desc "Split horizontal" "w -" #'evil-window-split
      :desc "Delete window"    "w d" #'delete-window

      :desc "Single window" "w 1" (cmd!
                                   (delete-other-windows))

      :desc "Split right (2 panes)" "w 2" (cmd!
                                           (evil-window-vsplit)
                                           (evil-window-right))

      :desc "Split right (3 panes)" "w 3" (cmd!
                                           (evil-window-vsplit)
                                           (evil-window-vsplit)
                                           (balance-windows))

      :desc "Select window" "w w" #'ace-window)

(map! :leader
      "g s" #'magit-status)

;; (setq doom-theme 'doom-solarized-dark)
(setq doom-theme 'solarized-dark)
;; (setq solarized-high-contrast-mode-line t)
(setq x-underline-at-descent-line t)
(setq doom-themes-enable-bold nil
      doom-themes-enable-italic t)
(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-tooltip-align-annotations t))
;; (after! lsp-pyright
;;   (setq lsp-pyright-langserver-command "basedpyright"))

;;; Add to $DOOMDIR/config.el
(with-eval-after-load 'python
  (set-formatter! 'ruff :modes '(python-mode python-ts-mode)))

(with-eval-after-load 'python
  (set-eglot-client! '(python-mode python-ts-mode) '("ty" "server")))
(setq display-line-numbers-type 'relative)

(set-email-account! "2e0byo"
                    '((mu4e-sent-messages-behavior . delete)
                      (mu4e-sent-folder      . "/2e0byo/sent")
                      (mu4e-trash-folder     . "/2e0byo/trash")
                      (mu4e-drafts-folder    . "/2e0byo/drafts")
                      (mu4e-refile-folder    . "/2e0byo/archive")
                      (smtpmail-smtp-server  . "smtp.gmail.com")
                      (user-full-name        . "John Morris" )
                      (smtpmail-smtp-user    . "2e0byo@gmail.com"))
                    t)
