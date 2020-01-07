# ZSH config
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
# So pc() can be called in the prompt
setopt PROMPT_SUBST
# Force emacs bindings
bindkey -e
# Setup tab completion for command options
autoload -Uz compinit
compinit


# Regular Aliases
if [ $(uname) = Darwin ]; then
    alias ll='ls -lhG'
else
    alias ll='ls -lh --color=auto --group-directories-first'
fi
alias la='ll -A'
alias lll='la | less'
alias mv='mv -i'
# Git
alias st='git status'
alias gsl='git stash list'
# Hosts
alias phi='ssh alarm@192.168.1.13'


# Fancy cd that works with multiple dots
#cd() { if [[ "$1" =~ ^\.\.+$ ]];then local a dir;a=${#1};while [ $a -ne 1 ];do dir=${dir}"../";((a--));done;builtin cd $dir;else builtin cd "$@";fi ;}


# Fancy prompt functions
function pc {
    local exit=$?
    local branch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2>/dev/null)

    if [ $branch ]; then
        echo "($branch) "
    fi

    return $exit
}

PROMPT='%n@%m %F{green}$(pc)%F{cyan}%3~%F{white}'$'\n''%F{yellow}$%F{default} '
#export PS1='\u@\h \[\e[32m\]$(pc)\[\e[m\]\[\e[36m\]\w\n\[\e[33m\]$\[\e[0m\] '


# The ol' ENVIRONMENT
PATH=~/bin:$PATH
export VISUAL=vim

if [ -t 0 ]; then
    echo -ne "\033[5 q"
fi
