;; crear estas ventanas:
;; 	| |_|
;;	|_|_|
;;

(split-window-horizontally)
(windmove-right)
(ansi-term "/bin/bash")

(split-window-vertically)
(windmove-down)
(ansi-term "/usr/bin/ipython3")
(windmove-left)
