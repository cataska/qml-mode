(defconst qml-font-lock-keywords-1
  (list
   '("\\<\\(Qt\\|import\\|property\\|function\\|Item\\|Rectangle\\|Image\\|Text\\|Text\\(Edit\\|Input\\)\\|MouseArea\\|ListView\\|GridView\\|ListModel\\|ListElement\\|Component\\|PropertyChanges\\|NumberAnimation\\|Transition\\|SequentialAnimation\\|ParallelAnimation\\|PauseAnimation\\|Timer\\)\\>" . font-lock-keyword-face)
   '("property[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-type-face)
   '("function[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-function-name-face)
   '("\\([a-zA-Z_\\.]+[a-zA-Z0-9_]*\\):" 1 font-lock-type-face)
   )
  )

(defvar qml-font-lock-keywords qml-font-lock-keywords-1)

(defun qml-mode()
  "Major mode for Qt declarative UI"
  (interactive)
  (kill-all-local-variables)
  (set (make-local-variable 'font-lock-defaults) '(qml-font-lock-keywords))
  (setq major-mode 'qml-mode)
  (setq mode-name "qml")
  )
(provide 'qml-mode)