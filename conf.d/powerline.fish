if type -q powerline-go
	function fish_prompt
			powerline-go \
				-error $status \
				-jobs (count (jobs -p)) \
				-cwd-mode plain \
				-hostname-only-if-ssh \
				-git-mode compact \
				-newline
	end
end
