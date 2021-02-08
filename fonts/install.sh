#!/bin/sh
install() {
	curl -Lso '/tmp/JetBrains Mono Regular Nerd Font Complete.ttf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
	cp '/tmp/JetBrains Mono Regular Nerd Font Complete.ttf' "$1"

	curl -Lso '/tmp/Hack Regular Nerd Font Complete.ttf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
	cp '/tmp/Hack Regular Nerd Font Complete.ttf' "$1"
}

if [ "$(uname -s)" = "Darwin" ]; then
	if command -v brew >/dev/null 2>&1; then
		brew tap homebrew/cask-fonts
		brew install --cask font-jetbrains-mono-nerd-font font-hack-nerd-font
	else
		install ~/Library/Fonts
	fi
else
	mkdir -p ~/.local/share/fonts/
	install ~/.local/share/fonts/
	fc-cache -f
fi
