(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path (locate-user-emacs-file "el-get-recipes"))

;; setup
(el-get-bundle emacs-jp/init-loader)
(el-get-bundle purcell/exec-path-from-shell)

;; input method
(when (executable-find "mozc_emacs_helper")
  (el-get-bundle mozc)
  (el-get-bundle d5884/mozc-popup
    :depends popup))

;; buffer
(el-get-bundle recentf-ext)
(el-get-bundle emacs-jp/elscreen)
(el-get-bundle wamei/elscreen-separate-buffer-list)
(el-get-bundle robario/elscreen-persist)
(el-get-bundle ibukanov/pc-bufsw (pc-bufsw-default-keybindings))
(el-get-bundle popwin)

;; helm
(el-get-bundle helm)

;; helm plugins
(el-get-bundle helm-descbinds)
(el-get-bundle helm-gtags)
(el-get-bundle helm-ag)

;; auto-complete
(el-get-bundle auto-complete)

;; yasnippet
(el-get-bundle yasnippet)

;; tex
(el-get-bundle yatex)
(el-get-bundle latex-math-preview
  :type git
  :url "https://gitlab.com/latex-math-preview/latex-math-preview.git")

;; magit
(el-get-bundle magit)

;; smartrep
(el-get-bundle myuhe/smartrep.el)

;; flycheck
(el-get-bundle flycheck)
;; (el-get-bundle flycheck-pos-tip)

;; python
(el-get-bundle jedi)
