;;; smart-return.el --- Break code lines fluently.

;; Copyright (C) 2014 Andrey Tykhonov <atykhonov@gmail.com>

;; Author: Andrey Tykhonov <atykhonov@gmail.com>
;; Maintainer: Andrey Tykhonov <atykhonov@gmail.com>
;; URL: https://github.com/atykhonov/smart-return/
;; Version: 0.1.0
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Installation

;; First of all please install the required dependency `smart-forward'
;; (Read: https://github.com/magnars/smart-forward.el)
;;
;; Then assuming that you cloned emacs-smart-return to the
;; `~/.emacs.d/smart-return/' folder. Add the following lines to your
;; `.emacs' file:
;;
;; (add-to-list 'load-path "~/.emacs.d/smart-return/")
;; (require 'smart-return)
;; (global-set-key (kbd "M-<return>") 'smart-return)
;;

;;; Commentary:

;;
;; This is a little tool may help to break code lines more
;; fluently.  It is most easily to explain by example.  For example you
;; have such code:
;;
;; (defun test ()
;;   (let ((test t))
;;     (if test
;;         (message "True")
;;       (mes|sage "False"))))
;;
;; Your cursor is in the middle of the "message" function.  And you
;; would like to add more code to the form `let'.  By means of this
;; little tool you can sequentially execute `smart-return' command
;; five times and you'll get the following:
;;
;; (defun test ()
;;   (let ((test t))
;;     (if test
;;         (message "True")
;;       (message "False"))
;;     |))
;;
;;
;; smart-return is a very thin wrapper around smart-forward (Read:
;; https://github.com/magnars/smart-forward.el).
;;

;;; Code:

(require 'smart-forward)


(defun smart-return ()
  "Breaks the code line depending on context."
  (interactive)
  (smart-forward)
  (newline-and-indent))

(defun smart-return-pre-command-hook ()
  "Hook for `pre-command-hook'."
  (interactive)
  (when (and (equal last-command
                    'smart-return)
             (equal this-command
                    'smart-return))
    (delete-indentation)))

(add-hook 'pre-command-hook 'smart-return-pre-command-hook)


(provide 'smart-return)

;;; smart-return.el ends here
