_fzf_previewer="cat {}"
[ -x "$(which chroma)" ] && _fzf_previewer="chroma -f terminal256 -s monokai {}"
export FZF_DEFAULT_OPTS="--info inline --tabstop 2 --bind 'ctrl-e:execute(vim -p {+})' --preview '$_fzf_previewer'"
unset _fzf_previewer

fzf-cd() {
	local root="$1"
	[ -z "$root" ] && root="."
	if [ -z "$root" ]; then
		root="."
	fi

	local find="find \"$root\" -type d"
	[ -x "$(which fd)" ] && find="fd -H -t d \"$root\" | tail -n +2"

	local dir="$(eval "$find" | fzf --preview='ls -al --color=always {}')"
	cd "$dir"
}

if [ -x "$(which brew)" ]; then
	fzf-brew() {
		case "$1" in
			local)
				brew list | fzf --multi --preview='brew info {}'
				;;

			remote)
				brew search | fzf --multi --preview='brew info {}'
				;;

			*)
				echo "Unknown command: $1" > /dev/stderr
				return 2
		esac
	}
fi

if [ -x "$(which apt)" ]; then
	fzf-apt() {
		case "$1" in
			remote)
				apt-cache search .* | fzf --multi --preview 'echo {} | cut -d " " -f 1 | xargs apt-cache show' | cut -d ' ' -f 1
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
				ipfs pin ls -t recursive | cut -d ' ' -f 1 | fzf --multi --preview '_ipfs_catls {}'
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
