[[ $- != *i* ]] && return

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTFILE=~/.bash_history
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\[\e[38;5;106m\]\u@\h\[\e[0m\] \[\e[38;5;69m\]\W\[\e[0m\]${PS1_CMD1} \$ '

alias ls='ls --color=auto'
alias la="ls -a"

# Spell Check
shopt -s cdspell
# Case unsensitive
bind 'set completion-ignore-case on'
# Show colors when tabbing through options
bind "set colored-stats on"
# Just show me every file in 1 Tab
bind 'set show-all-if-ambiguous on'
# Don't "less" dir just list all files
bind "set page-completions off"
# forward-search-history enabled
stty -ixon

export EDITOR="nvim"
export GOPATH="$HOME/.go"
export MANPAGER="nvim +Man!"
export GTK_THEME="Adwaita:dark"

source /usr/share/git/completion/git-prompt.sh
# fnm
eval "$(fnm env --use-on-cd --shell bash)"
