(defconst qml-font-lock-keywords-1
  (list
   '("\\<\\(import\\|property\\|function\\|Item\\|Rectangle\\|Image\\|Text\\|Text\\(Edit\\|Input\\)\\|MouseArea\\|ListView\\|GridView\\|ListModel\\|ListElement\\|Component\\|PropertyChanges\\|NumberAnimation\\|Transition\\|SequentialAnimation\\|ParallelAnimation\\|PauseAnimation\\|Timer\\)\\>" . font-lock-keyword-face)
   '("\\<Qt\\>" . font-lock-constant-face)
   '("\\<\\(int\\|bool\\|double\\|real\\|string\\|url\\|color\\|date\\|var\\|id\\|width\\|height\\|x\\|y\\|cellWidth\\|cellHeight\\|radius\\|source\\|opacity\\|duration\\|properties\\|property\\|interval\\|repeat\\|running\\|model\\|delegate\\)\\>" . font-lock-type-face)
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