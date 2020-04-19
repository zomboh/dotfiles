# vim:ft=zsh
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt append_history
# no duplicates
setopt hist_ignore_all_dups
# ignore space prefixed commands
unsetopt hist_ignore_space
# trim blanks
setopt hist_reduce_blanks
# show before executing history commands
setopt hist_verify
# add commands as they are typed, don't wait until shell exit 
setopt inc_append_history
# share hist between sessions
setopt share_history
# !keyword
setopt bang_hist
