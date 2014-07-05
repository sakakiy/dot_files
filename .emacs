; ロードパス
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp/")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
      
;; 行番号を表示する
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")

;; ウィンドウサイズの位置、サイズ
(if window-system (progn
  (setq initial-frame-alist '((width . 110)(height . 53)(top . 0)(left . 48)))
  (set-background-color "Black")
  (set-foreground-color "White")
  (set-cursor-color "Gray")
))

;; ウィンドウの透明化
(add-to-list 'default-frame-alist '(alpha . (0.80 0.80)))

;;; ツールバーを非表示
;; M-x tool-bar-mode で表示非表示を切り替えられる
(tool-bar-mode -1)

;; タイトルバーにファイル名表示
(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; Macのキーバインドを使う。optionをメタキーにする。
(mac-key-mode 1)
(setq mac-option-modifier 'meta)

;; シフト + 矢印で範囲選択
1(setq pc-select-selection-keys-only t)
(pc-selection-mode 1)

;; 改行後にインデント
;(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-m" 'reindent-then-newline-and-indent)


;;M-g で指定行へジャンプ
(global-set-key "\M-g" 'goto-line)

;; 何文字目にいるか表示
(column-number-mode 1)

;; 行カーソル

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; タブキー
;(setq default-tab-width 4)
;(setq indent-line-function 'indent-relative-maybe)
;(setq indent-line-function 'indent-to-left-margin)

 ;; use whitespace instead of tab
 (setq indent-tabs-mode nil)
 (setq-default indent-tabs-mode nil)
 
 ;; Set the tab width
 (setq default-tab-width 4)
 (setq tab-width 4)
 (setq c-basic-indent 4)

;; フォント設定
(if (eq window-system 'mac) (require 'carbon-font))
(if window-system (fixed-width-set-fontset "hirakaku_w3" 12))
(if window-system (setq fixed-width-rescale nil))

;; CSS設定
;; タブ幅4、インデント修正
(setq cssm-indent-level 4)
(setq cssm-indent-function #'cssm-c-style-indenter)

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



