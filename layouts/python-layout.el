
;; tab inserta 4 espacios cuando no funciona como autocompletado
(add-hook 'inferior-python-mode-hook
  (lambda ()
    (setq
      indent-tabs-mode nil ;; i.e. indent with spaces
      tab-width 4          ;; i.e. tabs consts of 4 spaces
      )))

;; remapeo para hacerlo como shell bash
(defun mp-add-python-keys ()
  " remap keys to act like bash shell "
  (interactive)
  (local-set-key (kbd "C-p") 'comint-previous-input)
  (local-set-key (kbd "C-n") 'comint-next-input)
  (local-set-key (kbd "C-r") 'comint-history-isearch-backward-regexp))

(add-hook 'inferior-python-mode-hook 'mp-add-python-keys)

;; crear estas ventanas:
;; 	| | |
;;	|_|_|
;;
(split-window-horizontally)

;; usar ipython como intérprete
(setq python-shell-interpreter "/usr/bin/ipython3")

;; cargar buffer con intérprete python:
;; función: (run-python CMD &optional DEDICATED SHOW)
(run-python "/usr/bin/ipython3")

;; vete a esa pantalla y buffer
(windmove-right)
(switch-to-buffer "*Python*")

;; dentro del intérprete Python:
;; Los colores de Ipyhon estorban, ya tengo un tema con colores en el editor
(process-send-string "*Python*" "%colors nocolor\n")
