nvim() { wt.exe -w 0 nt -p "Nvim" -d . nvim "$@"; }
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }
export COLUMNS=$(tput cols 2>/dev/null || echo 220)
export LINES=$(tput lines 2>/dev/null || echo 50)
export PATH="$HOME/.local/bin:$PATH"
alias flutterfire="flutterfire.bat"
