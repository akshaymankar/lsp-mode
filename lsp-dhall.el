(require 'lsp-mode)

(defgroup lsp-dhall nil
  "LSP support for the dhall-lang programming language, using the server from https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-lsp-server"
  :group 'lsp-mode
  :link '(url-link "https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-lsp-server"))

(defcustom lsp-dhall-dhall-language-server-path
  "dhall-lsp-server"
  "Path for dhall-language-server."
  :group 'lsp-dhall
  :type 'file)

(defun lsp-dhall-activate-p (filename &optional _)
  "Check if the javascript-typescript language server should be enabled based on FILENAME."
  (string-match-p (rx (one-or-more char) ".dhall" string-end) filename))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection lsp-dhall-dhall-language-server-path)
                  :major-modes '(dhall-mode)
                  :priority -1
                  :server-id 'dhall-lsp-server))

(provide 'lsp-dhall)
;;; lsp-dhall.el ends here
