# vim ft=zsh
setopt prompt_subst

get_git_branch() {
  git symbolic-ref --short HEAD 2> /dev/null
}

local time='%F{blue}%*%f'
local user_host="%F{yellow}%n@%m%f"
local current_dir="%F{red}%~%f"
local git_branch='%F{magenta}$(get_git_branch)%f'
local dyn_prompt='%F{%(0?.cyan.red)}$ %f'

PROMPT="${time} ${user_host}:${current_dir} ${git_branch}
${dyn_prompt}"
