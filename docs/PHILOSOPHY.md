# PHILOSOPHY

> Philosophical stuff about this dotfiles structure, decisions, etc..

## Why?

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

You can also [read my post on the subject](http://carlosbecker.com/posts/dotfiles-are-meant-to-be-forked).

## Decisions

### Default `EDITOR`, `VEDITOR`, `PROJECTS` and `PROJECTS_WORK`

`VEDITOR` stands for "visual editor", and is set to `code` by default. `EDITOR`
is set to `vim`.

You can change that by adding your custom overrides in `~/.localrc`.

#### Projects

`PROJECTS` is default to whatever is specified when you initialize the dotfiles. The shortcut to that folder in the shell
is `c`.

`$PROJECTS_WORK` is default to nothing, unless you specify an work projects dir when you initialize the dotfiles.
The shortcut to that folder in the shell is `c`.

You can change these at initialization time or by running chezmoi with the `-init` flag (ex:`chezmoi apply --init`)

### Topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Erlang" — you can simply add a `erlang` directory under the `components` directory and
put files in there. The following files are automatically picked up by chezmoi and added to their respective
files in `~/.dotfiles`:
- `aliases.zsh`
- `completion.zsh`
- `path.zsh`
Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

### Naming conventions

There are a few special files in the hierarchy:

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/install.sh**: Any file with this name and with exec permission, will
ran at `bootstrap` and `dot_update` phase, and are expected to install plugins,
and stuff like that.

### ZSH plugins

This project uses the [p10k](https://github.com/romkatv/powerlevel10k) prompt (which is awesome!) and some other
[zsh plugins](/znap/plugins.zsh). All of them managed by [znap](https://github.com/marlonrichert/zsh-snap).

### Compatibility

I try to keep it working in both Linux (no specific distro) and OS X,
mostly because I use OS X at home and Linux at work.

The CI also is also ran on Linux and OSX.
