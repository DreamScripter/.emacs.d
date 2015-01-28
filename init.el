;; disable visual distractions
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

;; disable welcome
(setq inhibit-startup-message t)

;; ctrl-tab for cycle through windows 
(global-set-key (kbd "<C-tab>") 'other-window)

;; fuentes
(add-to-list 'default-frame-alist '(font .  "Source Code Pro" ))
(set-face-attribute 'default t :font  "Source Code Pro" )

;; package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; tema (colores)
(load-theme 'wheatgrass t)  ;; para la noche
;; (load-theme 'tsdh-light t)  ;; para el día

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

(load "~/.emacs.d/config/python_layout")
