;; ロードパス
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp/")

;; 行番号を表示する
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")

;; ウィンドウサイズの位置、サイズ
(if window-system (progn
		    (setq initial-frame-alist '((width . 80)(height . 70)(top . 0)(left . 1320)))
		    (set-background-color "Black")
		    (set-foreground-color "White")
		    (set-cursor-color "Gray")
		    (set-frame-parameter nil 'alpha 85) ;;透明化
		    ))

;;; ツールバーを非表示
(tool-bar-mode -1)

;; タイトルバーにファイル名表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; スタートアップページを表示しない

;; 日本語の設定（UTF-8）
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; 日本語IM用の設定（inline_patch を当てていることが条件）
(setq default-input-method "MacOSX")

;; @ Mavericks用デフォルトディレクトリを"/"から"~/"にする設定
(setq inhibit-splash-screen t)
(defun cd-to-homedir-all-buffers ()
  "Change every current directory of all buffers to the home directory."
  (mapc
   (lambda (buf) (set-buffer buf) (cd (expand-file-name "~"))) (buffer-list)))
(add-hook 'after-init-hook 'cd-to-homedir-all-buffers)

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
;;バッファにファイルをドラッグドロップしてファイルを開く
(define-key global-map [ns-drag-file] 'ns-find-file)
;; マウス・スクロールを滑らかにする（Mac Emacs 専用）
;; (setq mac-mouse-wheel-smooth-scroll t)
;; ツールバーを表示しないようにする（Official Emacs の場合は 0）
					; (tool-bar-mode 0)
;; ウィンドウ（フレーム）のサイズ設定する
(setq default-frame-alist '((width . 100) (height . 35)))
;; 何文字目にいるか表示
(column-number-mode 1)
;; 括弧の対応関係をハイライト表示
(show-paren-mode nil)

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "ForestGreen"
                  :underline nil))
    (t ()))
  "*Face used by hl-line.")
;;(setq hl-line-face 'underline)
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;パッケージ管理
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; (setq package-check-signature nil)

; (require 'melpa)
(require 'undo-tree)
(global-undo-tree-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; キーの設定（ある程度 Mac 標準に準拠させる）
(setq mac-command-key-is-meta nil)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(global-set-key [?\s-c] 'kill-ring-save)
(global-set-key [?\s-v] 'yank)
(global-set-key [?\s-x] 'kill-region)
(global-set-key [?\s-z] 'undo)
(global-set-key [?\s-s] 'save-buffer)
(global-set-key [?\s-q] 'save-buffers-kill-terminal)
(global-set-key [?\s-f] 'isearch-forward)
(global-set-key [?\s-g] 'isearch-repeat-forward)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'help)
;(global-set-key "\C-:" 'toggle-input-method)
(define-key global-map [?\C-:] 'toggle-input-method)
(global-set-key "\C-j" 'toggle-input-method)
(global-set-key "\C-u" 'scroll-down-command)
;(global-set-key "\C-j" 'newline-and-indent)
(define-key global-map [?\C-?] 'redo)

;; Set the tab width
(setq-default default-tab-width 4 indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-indent 4)

(cond
 ;; Cocoa Emacs, 日本語化パッチ
 ((and (eq window-system 'ns)
       (functionp 'mac-set-input-method-parameter))
  (setq default-input-method "MacOSX")
  ;; "Convert yen to backslash for JIS keyboard."
  ;; (mac-translate-from-yen-to-backslash)
  ;; Shift キーがシステム・IM に渡るようにする
  (mac-add-key-passed-to-system 'shift)
  )
 )

;; wakaiime
(require 'wakatime-mode)
(global-wakatime-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(wakatime-api-key "389d80ef-106b-4a60-b44c-4a06d49b5cd8")
 '(wakatime-cli-path "/Library/Python/2.7/site-packages/wakatime/cli.py"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
