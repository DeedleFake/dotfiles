if test -d "$HOME/.bun"
	set -x BUN_INSTALL "$HOME/.bun"
	set -xp --path PATH "$BUN_INSTALL/bin"
end
