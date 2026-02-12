set -g fish_greeting # Removes the startup message.
set -g fish_history_size 10000

fish_add_path -P "$HOME/.local/bin"
set -x LESS -R

if not status is-interactive; exit; end

alias cp "cp -i"
alias df "df -h"
alias free "free -m"
alias ls "ls --color=auto"
alias grep "grep --color=auto"

function fish_title
	pwd
end
