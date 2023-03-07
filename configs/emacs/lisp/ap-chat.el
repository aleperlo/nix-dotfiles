(setup (:package telega))

(setup erc
  (:option erc-server "irc.libera.chat"
	   erc-nick "perlomeno"
	   erc-full-name "Alessandro Perlo"
	   erc-autojoin-channels-alist '(("irc.libera.chat" "#emacs" "#haskell"))
	   erc-kill-buffer-on-part t))

(provide 'ap-chat)
