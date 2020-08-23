# General

-   Learn with <https://www.hackerrank.com/> (especially Clojure). Complete some harder problems in functional programming.
-   www.pythonchallenge.com
-   Exercise


## TODO Read introduction to elisp


## TODO Diff, ediff

-   `a` or `b` to select which version is correct. Append `x` for saving.
-   In magit, use `e` for diffing with ediff.


## magit and git, gitimmersion

-   [X] Revert file in magit
-   [ ] Read introduction


## Master/read manual org-mode

-   org-mode easy template (e.g. `<s[tab]`) allows to easily include org syntax. `C-c C-,` to open the shortcut window.
-   `C-c C-q` (insert tags), `C-c /` (filter org-file by).


## Rewrite emacs.d through org-mode and usepackage.

It would be good to get a unified version of my **.emacs.d** with org files and usepackage.


## Dired mode

-   Find files with grep
-   Still have to learn the new shortcuts. Most important are `R`, `C`, `D`, `(`, `% m` and =% g0.
-   Using `Q`, empower the user to query and replace in files. Using `* u` to select all non-saved buffer to close them all.


## Perfect use of keyboard <code>[2/2]</code>

-   [X] The comma should be hit with the middle finger.
-   [X] Emacs keybindings should be used using both hands, this has to be set with key-bindings.
-   Tip: use the hand palm for reaching the CTRL keys.
-   [ ]: balance the space between the hand. Especially the right thumb as most words in english finish with the left hand letters.


## Write a script to update my-emacs-config automatically.

Best way would be to use git. Used a fork of emacs-live.


## DONE Remap C-c C-z to C-c C-y for Swiss Keyboards, for terminal switching.


## DONE Emmet in Emacs, with HAML filter in the json snippet.

HAML is automatic in emacs. However, the key bindings need to be remapped as the usage of \`C-j\` is too much widespread.


## DONE Cppcheck

```sh
wget https://raw.githubusercontent.com/google/styleguide/gh-pages/cpplint/cpplint.py
sudo mv cpplint.py /usr/local/bin/cpplint.py
sudo chmod 755 /usr/local/bin/cpplint.py
```

Also uncomment the following

```emacs-lisp
(custom-set-variables
'(flycheck-c/c++-googlelint-executable "/usr/local/bin/cpplint.py"))
```

in `cpp-settings.el`.


## DONE Aspell

Set dictionary in French and German.

```
sudo apt-get install aspell-fr aspell-de
```


## Go to char (avy-goto-word-or-subword-1)

In prelude `"C-c j"` and then `char` jumps to a given character in the buffer.


## Deft ignore file regex

Set `deft-ignore-file-regexp` <span class="timestamp-wrapper"><span class="timestamp">[2020-05-06 Wed]</span></span>.


## Regex in search

For grouping you need to escape the parenthesis.

-   [Documentation on regex](https://www.gnu.org/software/emacs/manual/html_node/emacs/Regexps.html)
-   [Escape characters](https://www.gnu.org/software/emacs/manual/html_node/elisp/Regexp-Backslash.html#Regexp-Backslash)


## See also (generated)

-   <20200430154352-cli_arguments.md>
-   <20200430154528-multiple_environment.md>
-   <20200503165952-materiala.md>
-   <20200505164639-cider.md>
