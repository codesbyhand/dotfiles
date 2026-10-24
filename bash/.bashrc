nvim() { wt.exe -w 0 nt -p "Nvim" -d . nvim "$@"; }
export COLUMNS=$(tput cols 2>/dev/null || echo 220)
export LINES=$(tput lines 2>/dev/null || echo 50)
export PATH="$HOME/.local/bin:$PATH"
