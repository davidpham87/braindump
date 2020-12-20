# Emacs


## Python

When working with conda, install [Miniconda](https://docs.conda.io/en/latest/miniconda.html) and set `conda-anaconda-home` to `/usr/lib/miniconda3` to make it run.

```elisp
(setq conda-anaconda-home "/usr/lib/miniconda3")
```


## Mac

Install Ukulele to install the logitech keyboards layout for Mac. Then the following create a similar experience to usual pc layout

```elisp
;; Rebind altgr + key to the correct default behavior
;; To get the same alt as the american keyboard
(let* ((km '(("¥" "M-y") ("≈" "M-x") ("©" "M-c") ("√" "M-v") ("∫" "M-b")
	     ("å" "M-a") ("ß" "M-s") ("∂" "M-d") ("ƒ" "M-f")
	     ("∑" "M-w") ("®" "M-r") ("†" "M-t")))
       (kmc (mapcar (lambda(y) (--map (concat "C-" it) y)) km)) ; C- variant
       (key-mapper (lambda (it) (define-key key-translation-map
				  (kbd (car it)) (kbd (car (cdr it)))))))
  (mapc key-mapper km)
  (mapc key-mapper kmc))

;; This is to make mac friendly
(setq mac-function-modifier 'control
      mac-command-modifier 'control
      mac-right-command-modifier 'control
      mac-control-modifier 'meta
      mac-right-option-modifier 'option)

;; Mac settings to have the same feeling as pc keyboard
(global-set-key (kbd "M-à") '"{")
(global-set-key (kbd "M-è") '"[")
(global-set-key (kbd "M-$") '"}")
(global-set-key (kbd "C-<") '"\\")
```
