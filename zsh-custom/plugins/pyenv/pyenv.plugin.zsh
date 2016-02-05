if [[ -n "$PYENV_ROOT" ]]; then
	function pyenv_prompt_info() {
		echo "$(pyenv version-name)"
	}
else
	function pyenv_prompt_info() { echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')" }
fi
