_fzf_previewer="cat {}"
[ -x "$(which chroma)" ] && _fzf_previewer="chroma -s github {}"
export FZF_DEFAULT_OPTS="--info inline --tabstop=2 --preview='$_fzf_previewer'"
unset _fzf_previewer

fzf-cd() {
	local root="$1"
	local clean="cat"
	if [ -z "$root" ]; then
		root="."
		clean="cut -c3- | sed '/^$/d'"
	fi

	local dir="$(find "$root" -type d | eval "$clean" | fzf --preview='ls -al --color=always {}')"
	cd "$dir"
}

if [ -x "$(which brew)" ]; then
	fzf-brew() {
		case "$1" in
			local|remote)
				brew "$1" | fzf --multi --preview='brew info {}'
				;;

			*)
				echo "Unknown command: $1" > /dev/stderr
				return 2
		esac
	}
fi

if [ -x "$(which ipfs)" ]; then
	_ipfs_catls() {
		local out

		out="$(ipfs cat "$1" 2>&1)"
		if [ "$out" = "Error: this dag node is a directory" ]; then
			out="$(ipfs ls "$1")"
		fi

		echo "$out"
	}

	fzf-ipfs() {
		case "$1" in
			pins)
				ipfs pin ls -t recursive | cut -d ' ' -f 1 | fzf --multi --preview='_ipfs_catls {}'
				;;

			*)
				echo "Unknown command: $1" > /dev/stderr
				return 2
		esac
	}
fi

if [ -x "$(which git)" ]; then
	fzf-git() {
		case "$1" in
			log)
				git log --oneline | fzf --multi --preview='git show --color=always {+1}' | cut -d ' ' -f 1
				;;

			*)
				echo "Unknown command: $q" > /dev/stderr
				return 2
		esac
	}
fi
