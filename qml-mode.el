(defvar qml-mode-hook nil)

(defconst qml-font-lock-keywords
  (let ((kw1 (mapconcat 'identity
                        '("Qt" "import" "property"
                          "State" "PropertyChanges" "StateGroup" "ParentChange"
                          "StateChangeScript" "AnchorChanges" "PropertyAnimation" "NumberAnimation"
                          "ColorAnimation" "RotationAnimation" "SequentialAnimation" "ParallelAnimation"
                          "PauseAnimation" "ParentAnimation" "AnchorAnimation" "SmoothedAnimation"
                          "PropertyAction" "ScriptAction" "Transition" "SpringFollow"
                          "Behavior" "Binding" "ListModel" "ListElement"
                          "VisualItemModel" "VisualDataModel" "Package" "XmlListModel"
                          "XmlRole" "Connections" "Component" "Timer"
                          "QtObject" "WorkerScript" "Item" "Rectangle"
                          "Image" "BorderImage" "Text" "TextInput"
                          "TextEdit" "MouseArea" "FocusScope" "Flickable"
                          "Flipable" "GestureArea" "Loader" "Repeater"
                          "SystemPalette" "LayoutItem" "Scale" "Rotation"
                          "Translate" "ViewsPositionersMediaEffects" "ListView" "GridView"
                          "PathView" "Path" "PathLine" "PathQuad"
                          "PathCubic" "PathAttribute" "PathPercent" "WebView"
                          "Column" "Row" "Grid" "Flow"
                          "SoundEffect" "Audio" "Video" "Particles"
                          "ParticleMotionLinear" "ParticleMotionGravity" "ParticleMotionWander")
                        "\\|"))
        (js-keywords (mapconcat 'identity
                                '("break"
                                  "case" "catch" "const" "continue"
                                  "debugger" "default" "delete" "do"
                                  "else" "enum"
                                  "false" "finally" "for" "function"
                                  "if" "in" "instanceof" "import"
                                  "let"
                                  "new" "null"
                                  "return"
                                  "switch"
                                  "this" "throw" "true" "false" "try" "typeof"
                                  "var" "void"
                                  "while" "with"
                                  "yield"
                                  "undefined")
                                "\\|"))
        )
    (list
     (cons (concat "\\<\\(" kw1 "\\)\\>") font-lock-keyword-face)
     (cons (concat "\\<\\(" js-keywords "\\)\\>") font-lock-keyword-face)
     '("property[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-type-face)
     '("function[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-function-name-face)
     '("\\([a-zA-Z_\\.]+[a-zA-Z0-9_]*\\):" 1 font-lock-type-face)
     )
    ))


(defvar qml-mode-syntax-table
  (let ((qml-mode-syntax-table (make-syntax-table)))
    ; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" qml-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" qml-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" qml-mode-syntax-table)
    qml-mode-syntax-table)
  "Syntax table for qml-mode")

(defvar qml-font-lock-keywords qml-font-lock-keywords)

(defun qml-indent-line ()
  "Indent current line for `qml-mode'."
  (interactive)
  (let ((indent-col 0))
    (save-excursion
      (beginning-of-line)
      (condition-case nil
          (while t
            (backward-up-list 1)
            (when (looking-at "[[{]")
              (setq indent-col (+ indent-col qml-indent-offset))))
        (error nil)))
    (save-excursion
      (back-to-indentation)
      (when (and (looking-at "[]}]") (>= indent-col qml-indent-offset))
        (setq indent-col (- indent-col qml-indent-offset))))
    (indent-line-to indent-col)))

(defvar qml-indent-offset 4
  "*Indentation offset for `qml-mode'.")

(defun qml-indent-closing-brace (&optional arg)
  (interactive)
  (insert "}")
  (indent-for-tab-command)
  (end-of-line)
)

(define-derived-mode qml-mode text-mode "qml-mode"
  "Major mode for Qt declarative UI"
  (set-syntax-table qml-mode-syntax-table)
  (make-local-variable 'qml-indent-offset)
  (set (make-local-variable 'font-lock-defaults) '(qml-font-lock-keywords))
  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'indent-tabs-mode) nil)
  (set (make-local-variable 'indent-line-function) 'qml-indent-line)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "}") 'qml-indent-closing-brace)
)

(provide 'qml-mode)
