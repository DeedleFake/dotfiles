if type -q fzf
  fzf --fish | source
end

set FZF_DEFAULT_OPTS \
	--height 80% \
	--margin 5% \
	--border \
	--layout reverse \
	--info=inline

set -l fzf_preview "$(status dirname)/../scripts/fzf-preview"
if test -x "$fzf_preview"
  set -a FZF_DEFAULT_OPTS \
		--preview "'$fzf_preview {}'" \
		--preview-window down
end
