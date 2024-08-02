eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias cd='z'
alias ls='eza'
alias diff='colordiff -u'

if type batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi

alias ll='ls -la --group-directories-first'
alias gdb='gdb -q'
alias python='python3'

