function fish_title
    echo (prompt_pwd)
end

alias cp "cp -i"
alias df "df -h"
alias free "free -m"
alias ls "ls --color=auto"
alias grep "grep --color=auto"

set PLUGIN_DIR /usr/share/fish/vendor_functions.d
if test -f $PLUGIN_DIR/fish-syntax-highlighting.fish
    source $PLUGIN_DIR/fish-syntax-highlighting.fish
end
if test -f $PLUGIN_DIR/fish-history-substring-search.fish
    source $PLUGIN_DIR/fish-history-substring-search.fish
end
if test -f $PLUGIN_DIR/fish-autosuggestions.fish
    source $PLUGIN_DIR/fish-autosuggestions.fish
end
