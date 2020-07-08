_dir="$(dirname "$BASH_SOURCE")"

[ -f "$_dir/liquidprompt/liquidprompt" ] && . "$_dir/liquidprompt/liquidprompt"

export HISTCONTROL=erasedups
export EDITOR=vim

[ -x "$(which fzf)" ] && . "$_dir/fzf.bash"

unset _dir
