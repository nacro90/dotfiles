# nacro90
# Shell independent profile file

# ~/bin to path
[ -d "$HOME/bin" ] && PATH="${PATH}:${HOME}/bin"

# set PATH so it includes user's private bin recuresively if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$(find "$HOME/.local/bin" -type d | tr '\n' ':')$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache/"

export DWM_HOME="$HOME/.local/lib/dwm"
export SURF_HOME="$HOME/.local/lib/surf"
export ST_HOME="$HOME/.local/lib/st"
export DMENU_HOME="$HOME/.local/lib/dmenu"
export VIM_HOME="$XDG_CONFIG_HOME/nvim"

export LESSHISTFILE="$XDG_DATA_HOME/less/history"

export HISTFILE="$XDG_DATA_HOME/bash/history"

export CARGO_HOME="$XDG_DATA_HOME/cargo"

export NVM_DIR="$XDG_DATA_HOME/nvm"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc" 

export PYLINTHOME="$XDG_CACHE_HOME/pylint"

export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"

export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"

export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"

export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# Java home
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=${PATH}:${JAVA_HOME}/bin

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig

export EDITOR='nvim'


# export FZF_DEFAULT_COMMAND='find . -not -path "*/.git/*" 2>/dev/null'
export FZF_TMUX=1
export FZF_DEFAULT_OPTS='--color=16 --bind=ctrl-b:page-up --bind=ctrl-f:page-down --bind=ctrl-u:half-page-up --bind=ctrl-d:half-page-down --preview='\''pistol {}'\''

export DOTFILES_REPO="$HOME/.dot"

export TODO="$HOME/note/todo.txt"
export QUICK="$HOME/note/quick.md"
export CALENDAR="$HOME/note/calendar"
