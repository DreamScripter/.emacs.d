;; disable visual distractions
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

;; disable welcome
(setq inhibit-startup-message t)

;; ctrl-tab for cycle through windows 
(global-set-key (kbd "<C-tab>") 'other-window)

;; package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; tema (colores)
(load-theme 'waher t) ;; para la noche
;; (load-theme 'whiteboard t) ;; para el día

;; fuentes
(add-to-list 'default-frame-alist '(font .  "Source Code Pro" ))
(set-face-attribute 'default t :font  "Source Code Pro" )

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional

;; supuestamente va más fluido así
(setq redisplay-dont-pause t)

;; entorno para python
;; (load "~/.emacs.d/layouts/python-layout")
