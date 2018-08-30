function theme_precmd {
        now=$(($(date +%s%N)/1000000))
        elapsed="$(($now-$timer))ms"
        timer=$(($(date +%s%N)/1000000))
}

theme_preexec () {
        timer=$(($(date +%s%N)/1000000))
}

local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"

PROMPT='%{$fg[blue]%}{ %c } \
%{$fg[green]%}$(  git rev-parse --abbrev-ref HEAD 2> /dev/null || echo ""  )%{$reset_color%} \
%{$fg[red]%}%(!.#.»)%{$reset_color%} '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

RPS1='%{$fg[blue]%}%~%{$reset_color%} ${return_code} %{$fg[reg]%}${elapsed}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:: %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
add-zsh-hook preexec theme_preexec
timer=$(($(date +%s%N)/1000000))
