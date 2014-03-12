Smart return
==================

This is a little tool may help to break code lines more fluently. It
is most easily to explain by example. For example you have such code:

(defun test ()
  (let ((test t))
    (if test
        (message "True")
      (message "False"))))

Your cursor is in the middle of the "message" function.  And you
would like to add more code to the form `let'.  By means of this
little tool you can sequentially execute `smart-return' command
three times and you'll get the following:

(defun test ()
  (let ((test t))
    (if test
        (message "True")
      (message "False"))
    |))

smart-return is a very thin wrapper around smart-forward (Read:
https://github.com/magnars/smart-forward.el).


### Installation

First of all please install the required dependency `smart-forward'
(Read: https://github.com/magnars/smart-forward.el)

Then assuming that you cloned emacs-smart-return to the
`~/.emacs.d/smart-return/' folder. Add the following lines to your
`.emacs' file:

(add-to-list 'load-path "~/.emacs.d/smart-return/")
(require 'smart-return)
(global-set-key (kbd "M-<return>") 'smart-return)


### Contribution

Any comments, suggestions, ideas, contribution are much welcome!
