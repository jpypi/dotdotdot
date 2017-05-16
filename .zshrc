# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
setopt PROMPT_SUBST

# Force use emacs keybindings
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/james/.zshrc'

autoload -Uz compinit
compinit

alias yakko="ssh themind@yakko.cs.wmich.edu"
alias phi="ssh james@192.168.1.103"
alias ll="ls -lh --color=always --group-directories-first"
alias la="ll -A"
alias st="git status"

PATH=~/bin:$PATH

#autoload -Uz promptinit
#promptinit
#prompt redhat

PROMPT='%n@%m %F{green}%3~%F{white}$(pwd > /dev/shm/.$(whoami)_shell_cwd)$ '

export VISUAL=vim
export EDITORY="$VISUAL"

if [ -t 0 ]; then
    echo -ne "\033[5 q"
fi
