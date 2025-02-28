if type -q powerline-go
	function fish_prompt
		powerline-go \
			-error $status \
			-jobs (count (jobs -p)) \
			-cwd-mode plain \
			-hostname-only-if-ssh \
			-git-mode compact \
			-mode compatible \
			-modules user,host,ssh,cwd,perms,git,jobs,root \
			-shell bare
	end

	function fish_right_prompt
		powerline-go \
			-modules exit,duration \
			-duration (math -s6 "$CMD_DURATION / 1000") \
			-error $status \
			-numeric-exit-codes \
			-duration-low-precision \
			-shell bare
	end
end
