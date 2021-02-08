# load asdf
if command -v brew >/dev/null 2>&1; then
	# brew is installed, let's register the default brew install location of asdf
	. $(brew --prefix asdf)/asdf.sh
#	. /usr/local/opt/asdf/asdf.sh
else
	. $HOME/.asdf/asdf.sh
fi
# Set asdf plugin settings
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

# append asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
