# load asdf
if command -v brew >/dev/null 2>&1; then
	# brew is installed, let's register the default brew install location of asdf
	. $(brew --prefix asdf)/asdf.sh
#	. /usr/local/opt/asdf/asdf.sh
else
	. $HOME/.asdf/asdf.sh
fi

# append asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Set asdf plugin settings
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh


# zsh parameter completion for the dotnet CLI
# Should be possible to remove this once asdf-dotnet-core implements it

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet
