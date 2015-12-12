;; naming of same name file
(require 'uniquify)
(custom-set-variables
 '(uniquify-buffer-name-style 'post-forward-angle-brackets))

;; use ibuffer instead of list-buffer
(defalias 'list-buffers 'ibuffer)
(with-eval-after-load 'bs
  (fset 'bs-message-without-log 'ignore))
