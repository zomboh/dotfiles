# vim:ft=zsh
autoload -Uz compinit
compinit
zmodload -i zsh/complist
# hash everything before completion
setopt hash_list_all
setopt completealiases
# when completing from the middle of a word, move the cursor to the end of the word
setopt always_to_end
# allow completion from within a word/phrase
setopt complete_in_word
# complete as much of a completion until it gets ambiguous.
setopt list_ambiguous

# completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# ignore case
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# menu if nb items > 2
zstyle ':completion:*' menu select=2
# colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# sections completion
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

# generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb

# bindings for navigating the complete list
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

