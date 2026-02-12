if test -d "$HOME/.bun"
	set -x BUN_INSTALL "$HOME/.bun"
	fish_add_path "$BUN_INSTALL/bin"
end
