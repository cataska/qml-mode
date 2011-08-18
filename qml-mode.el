(defvar qml-mode-hook nil)

;;(defvar qml-font-lock-default-face 'qml-font-lock-default-face)

(let ((red "#a35757")
			(green "#7ac470")
			(yellow "#dfe14e")
			(orange "#ef6d22")
			(blue "#5083b2")
			(magenta "#b781ac")
			(cyan "#b0b5d2")
			(white "#f0f0f0"))

	(defface qml-preprocessor-kwds-face
			`((t (:foreground ,yellow)))
		"*Face for preprocesor directives."
		)
  (defvar qml-preprocessor-kwds-face 'qml-preprocessor-kwds-face)

	(defface qml-constant-kwds-face
			`((t (:foreground ,cyan)))
		"*"
		)
	(defvar qml-constant-kwds-face 'qml-constant-kwds-face)

	(defface qml-global-funcs-face
			`((t (:foreground ,red)))
		"*"
		)
	(defvar qml-global-funcs-face 'qml-global-funcs-face)

	(defface qml-global-classes
			`((t (:foreground ,blue)))
		"*"
		)
	(defvar qml-global-classes 'qml-global-classes)

	(defface qml-global-props-face
			`((t (:foreground ,blue)))
		"*"
		)
	(defvar qml-global-props-face 'qml-global-props-face)

	(defface qml-operators-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-operators-face 'qml-operators-face)

	(defface qml-specifier-kwds-face
			`((t (:foreground ,magenta)))
		"*"
		)
	(defvar qml-specifier-kwds-face 'qml-specifier-kwds-face)

	(defface qml-package-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-package-kwds-face 'qml-package-kwds-face)

	(defface qml-class-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-class-kwds-face 'qml-class-kwds-face)

	(defface qml-other-decl-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-other-decl-kwds-face 'qml-other-decl-kwds-face)

	(defface qml-other-decl-2-kwds-face
			`((t (:foreground ,blue)))
		"* function, var"
		)
	(defvar qml-other-decl-2-kwds-face 'qml-other-decl-2-kwds-face)

	(defface qml-decl-level-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-decl-level-kwds-face 'qml-decl-level-kwds-face)

	(defface qml-conditional-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-conditional-kwds-face 'qml-conditional-kwds-face)

	(defface qml-block-stmt-1-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-block-stmt-1-kwds-face 'qml-block-stmt-1-kwds-face)

	(defface qml-simple-stmt-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-simple-stmt-kwds-face 'qml-simple-stmt-kwds-face)

	(defface qml-label-kwds-face
			`((t (:foreground ,yellow)))
		"*"
		)
	(defvar qml-label-kwds-face 'qml-label-kwds-face)

	(defface qml-expr-kwds-face
			`((t (:foreground ,red)))
		"*"
		)
	(defvar qml-expr-kwds-face 'qml-expr-kwds-face)

	(defface qml-other-kwds-face
			`((t (:foreground ,red)))
		"*"
		)
	(defvar qml-other-kwds-face 'qml-other-kwds-face)

	(defface qml-package-name-face
			`((t (:foreground ,green)))
		"*"
		)
	(defvar qml-package-name-face 'qml-package-name-face)

	(defface qml-class-name-face
			`((t (:foreground ,cyan)))
		"*"
		)
	(defvar qml-class-name-face 'qml-class-name-face)

	(defface qml-function-name-face
			`((t (:foreground ,green)))
		"*"
		)
	(defvar qml-function-name-face 'qml-function-name-face)

	(defface qml-variable-name-face
			`((t (:foreground ,cyan)))
		"*"
		)
	(defvar qml-variable-name-face 'qml-variable-name-face)
  )

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
        (kw2 (mapconcat 'identity
                        '("int" "bool" "double" "real"
                          "string" "url" "color" "date"
                          "variant" "alias"
                          "signal" "on" "parent" "as")
                        "\\|"))
        (kw3 (mapconcat 'identity
                        '("NoButton" "LeftButton" "RightButton" "MidButton"
                          "MiddleButton"
                          "Horizontal" "Vertical"
                          "AlignLeft" "AlignRight" "AlignHCenter" "AlignTop"
                          "AlignBottom" "AlignVCenter" "AlignCenter"
                          "Easing" "Linear" "InQuad" "OutQuad"
                          "InOutQuad" "OutInQuad" "InCubic" "OutCubic"
                          "InOutCubic" "OutInCubic" "InQuart" "OutQuart"
                          "InOutQuart" "OutInQuart" "InQuint" "InQuint"
                          "OutQuint" "InOutQuint" "OutInQuint" "InSine"
                          "OutSine" "InExpo" "OutExpo" "InOutExpo"
                          "OutInExpo" "InCirc" "OutCirc" "InOutCirc"
                          "OutInCirc" "InElastic" "OutElastic" "InOutElastic"
                          "OutInElastic" "InBack" "OutBack" "InOutBack"
                          "OutInBack" "InBounce" "OutBounce" "InOutBounce"
                          "OutInBounce")
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
     (list (concat "\\<\\(" kw2 "\\)\\>[ \t]*[^:]") 1 qml-function-name-face)
     ;;(cons (concat "\\<\\(" kw2 "\\)\\>[ \t]*[^:]") qml-other-kwds-face)
     (cons (concat "\\<\\(" kw3 "\\)\\>") font-lock-constant-face)
     (cons (concat "\\<\\(" js-keywords "\\)\\>") font-lock-keyword-face)
     ;;'("property[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 1 font-lock-type-face)
     (list (concat "property[ \t]+\\(" kw2 "\\)+[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)") 2 font-lock-variable-name-face)
     ;;'("\\(function\\|signal\\)\\{1\\}[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 2 font-lock-function-name-face)
     '("\\(function\\|signal\\)\\{1\\}[ \t]+\\([a-zA-Z_]+[a-zA-Z0-9_]*\\)" 2 qml-function-name-face)
     '("\\([a-zA-Z_\\.]+[a-zA-Z0-9_]*\\)[ \t]*:" 1 font-lock-type-face)
     '("\\([a-zA-Z0-9]+\\)[ \t]*{" 1 qml-specifier-kwds-face)
     '("\\<id[ \t]*:[ \t]*\\([a-zA-Z0-9_]+\\)" 1 font-lock-constant-face)
     '("\\([+-]?\\<[0-9]*\\.?[0-9]+[xX]?[0-9a-fA-F]*\\)" 1 font-lock-constant-face)
     ;; '("\\<\\(0[xX][0-9a-fA-F]+\\)" 1 font-lock-constant-face)
     )
    ))


(defvar qml-mode-syntax-table
  (let ((qml-mode-syntax-table (make-syntax-table)))
    ; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" qml-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" qml-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" qml-mode-syntax-table)
    (modify-syntax-entry ?' "\"" qml-mode-syntax-table)
    qml-mode-syntax-table)
  "Syntax table for qml-mode")

(defvar qml-indent-width 4)

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
		  (setq indent-col (+ indent-col qml-indent-width))))
        (error nil)))
    (save-excursion
      (back-to-indentation)
      (when (and (looking-at "[]}]") (>= indent-col qml-indent-width))
	(setq indent-col (- indent-col qml-indent-width))))
    (indent-line-to indent-col)))

(defun qml-indent-closing-brace (&optional arg)
  (interactive)
  (insert "}")
  (indent-for-tab-command)
  (end-of-line))

(define-derived-mode qml-mode text-mode "qml-mode"
  "Major mode for Qt declarative UI"
  (set-syntax-table qml-mode-syntax-table)
  (make-local-variable 'qml-indent-width)
  (set (make-local-variable 'font-lock-defaults) '(qml-font-lock-keywords))
  (set (make-local-variable 'tab-width) 4)
  (set (make-local-variable 'indent-tabs-mode) nil)
  (set (make-local-variable 'indent-line-function) 'qml-indent-line)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "}") 'qml-indent-closing-brace)
  (local-set-key (kbd "M-;") #'(lambda (arg) (interactive "*P")
                                       (require 'newcomment)
                                       (let ((deactivate-mark t)
                                             (comment-start "//") (comment-end ""))
                                         (comment-dwim arg)
                                         (if mark-active
                                             (deactivate-mark))))))

(provide 'qml-mode)
