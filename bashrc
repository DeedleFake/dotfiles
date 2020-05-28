if [ -x "$(which chroma)" ]; then
	chroma() {
		exec cat "$3"
	}
fi

export HISTCONTROL=erasedups
export EDITOR=vim
export FZF_DEFAULT_OPTS="--info inline --preview='chroma -s github {}'"
