set -xp --path PATH "$HOME/.local/bin"

alias cp "cp -i"
alias df "df -h"
alias free "free -m"
alias ls "ls --color=auto"
alias grep "grep --color=auto"

function fish_title
    echo (prompt_pwd)
end
