;; -*- lexical-binding: t -*-

(prefer-coding-system 'utf-8)

;; disable visual distractions
;;(menu-bar-mode -1) 
;;(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

;; disable welcome
(setq inhibit-startup-message t)

;; package management
(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; fuentes
(add-to-list 'default-frame-alist '(font .  "Source Code Pro" ))
(set-face-attribute 'default t :font  "Source Code Pro" )
;; (set-face-attribute 'default nil :height 110)

;; números de línea
(setq linum-format "%d ")

;; supuestamente va más fluido así
(setq redisplay-dont-pause t)

;; quitar wrapping lines
(setq-default truncate-lines t)

;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)

;; four spaces
(setq-default tab-width 4)

;; comillas, corchetes etcétera por pares
(electric-pair-mode 1)

;; customizaciones específicas para linux
(when (eq system-type 'gnu/linux)
  ;; tema (colores)
  (load-theme 'waher t) ;; para la noche
  ;; (load-theme 'whiteboard t) ;; para el día

  ;; jedi
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)                 ; optional
  ;; entorno para python
  (load "~/.emacs.d/layouts/python-layout")
)

;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; evil
(require 'evil)
(evil-mode 1)

;; multiple cursors
(add-to-list 'load-path
              "~/.emacs.d/multiple-cursors.el")
(require 'multiple-cursors)

(global-set-key (kbd "M-C-,") 'mc/mark-next-like-this)
(global-set-key (kbd "M-C-.") 'mc/mark-previous-like-this)

;; bind C-x to g and C-h to ch
;; Note: lexical-binding must be t in order for this to work correctly.
   (defun make-conditional-key-translation (key-from key-to translate-keys-p)
     "Make a Key Translation such that if the translate-keys-p function returns true,
   key-from translates to key-to, else key-from translates to itself.  translate-keys-p
   takes key-from as an argument. "
     (define-key key-translation-map key-from
       (lambda (prompt)
         (if (funcall translate-keys-p key-from) key-to key-from))))
   (defun my-translate-keys-p (key-from)
     "Returns whether conditional key translations should be active.  See make-conditional-key-translation function. "
     (and
       ;; Only allow a non identity translation if we're beginning a Key Sequence.
       (equal key-from (this-command-keys))
       (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p))))
   (define-key evil-normal-state-map "c" nil)
   (define-key evil-motion-state-map "cu" 'universal-argument)
   (make-conditional-key-translation (kbd "ch") (kbd "C-h") 'my-translate-keys-p)
   (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)

;; websocket
;; (add-to-list 'load-path
;;               "~/.emacs.d/websocket")
;; (require 'websocket)


;; markdown viewer
;; (add-to-list 'load-path
;;               "~/.emacs.d/realtime-markdown-viewer")
;; (require 'realtime-markdown-viewer)
