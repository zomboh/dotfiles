# vim:ft=zsh
# set options
setopt auto_cd
setopt auto_remove_slash
setopt beep
setopt nomatch
setopt rm_star_silent
#unset options
unsetopt extended_glob
unsetopt notify

autoload -Uz zsh-mime-setup select-word-style run-help
# run everything as if it was an executable, using whatever program is associated to its mime type
zsh-mime-setup
# ctrl + w on words
select-word-style bash
