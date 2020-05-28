export FZF_DEFAULT_OPTS="--info inline --preview='chroma -s github {}'"

if ! [ -x "$(which chroma)" ]; then
	chroma() {
		cat "$3"
	}
fi

if [ -x "$(which brew)" ]; then
	fzf-brew() {
		case "$1" in
			uninstall)
				brew list | fzf --multi --preview='brew info {}' | xargs brew uninstall
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
			unpin)
				ipfs pin ls -t recursive | cut -d ' ' -f 1 | fzf --multi --preview='_ipfs_catls {}' | xargs ipfs pin rm
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
