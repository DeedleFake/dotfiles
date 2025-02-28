# Fish configuration based on the provided ZSH config for Manjaro

# Options
set -g fish_history_size 10000                    # Equivalent to HISTSIZE and SAVEHIST
set -g fish_wordchars '^[a-zA-Z0-9]'              # Adjust word characters (removing /, -, ., _, etc.)

# Fish doesn't have direct equivalents for all ZSH setopts, but some behaviors are default:
# - Extended globbing: Enabled by default with ** and *
# - Numeric glob sort: Default behavior
# - No beep: Default behavior
# - Append history immediately: Default behavior
# - Ignore commands starting with space: Default behavior
# - No warnings about background jobs: Default behavior
# Note: Fish doesn't support autocorrect like ZSH's 'correct'; consider a plugin or custom function.
# Note: Fish globbing is case-sensitive by default; use `string match -i` for case-insensitive operations.

# Keybindings
function fish_user_key_bindings
    # Emacs mode is default in Fish
    bind \e\[7~ beginning-of-line                # Home key
    bind \e\[H beginning-of-line                 # Home key (alternative)
    bind \e\[8~ end-of-line                      # End key
    bind \e\[F end-of-line                       # End key (alternative)
    bind \e\[2~ overwrite-mode                   # Insert key
    bind \e\[3~ delete-char                      # Delete key
    bind \e\[C forward-char                      # Right key
    bind \e\[D backward-char                     # Left key
    bind \e\[5~ history-prefix-search-backward   # Page up (adapted from ZSH)
    bind \e\[6~ history-prefix-search-forward    # Page down (adapted from ZSH)

    # Navigate words with ctrl+arrow keys
    bind \eOc forward-word                       # Ctrl+right
    bind \eOd backward-word                      # Ctrl+left
    bind \e\[1\;5D backward-word                 # Ctrl+left (alternative)
    bind \e\[1\;5C forward-word                  # Ctrl+right (alternative)
    bind \ch backward-kill-word                  # Ctrl+backspace
    bind \e\[Z undo                              # Shift+tab undo

    # History substring search (requires plugin)
    if type -q history-substring-search-up
        bind \e\[A history-substring-search-up   # Up arrow
        bind \e\[B history-substring-search-down # Down arrow
        bind $terminfo[kcuu1] history-substring-search-up
        bind $terminfo[kcud1] history-substring-search-down
    end
end

# Aliases
alias cp "cp -i"                                  # Confirm before overwriting
alias df "df -h"                                  # Human-readable sizes
alias free "free -m"                              # Show sizes in MB
alias gitu "git add . && git commit && git push"  # Git shortcut

# Theming (Color man pages with LESS_TERMCAP)
set -x LESS_TERMCAP_mb \e\[01\;32m
set -x LESS_TERMCAP_md \e\[01\;32m
set -x LESS_TERMCAP_me \e\[0m
set -x LESS_TERMCAP_se \e\[0m
set -x LESS_TERMCAP_so \e\[01\;47\;34m
set -x LESS_TERMCAP_ue \e\[0m
set -x LESS_TERMCAP_us \e\[01\;36m
set -x LESS -R

# Plugins
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

# Terminal Title
function fish_title
    # Simplified title: show current directory
    echo (prompt_pwd)
end

# LS Colors
set -x LS_OPTIONS '--color=auto'
alias ls "ls $LS_OPTIONS"

# Prompt (Using powerlevel10k if available)
if test -f /usr/share/fish/vendor_functions.d/powerlevel10k.fish
    source /usr/share/fish/vendor_functions.d/powerlevel10k.fish
end
