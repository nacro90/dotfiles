# nacro90
# Shell independent profile file

# ~/bin to path
[ -d "$HOME/bin" ] && PATH="${PATH}:${HOME}/bin"

# set PATH so it includes user's private bin recuresively if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$(find $HOME/.local/bin -type d | tr '\n' ':')$PATH"
fi

export XDG_CONFIG_HOME="$HOME/.config"

export DWM_HOME='/home/orcan/.local/lib/dwm'
export SURF_HOME='/home/orcan/.local/lib/surf'
export ST_HOME='/home/orcan/.local/lib/st'
export DMENU_HOME='/home/orcan/.local/lib/dmenu'

export LESSHISTFILE='~/.local/share/less/history'

# Java home
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
export PATH=${PATH}:${JAVA_HOME}/bin

export PASSWORD_STORE_DIR=$HOME/.pass/pass

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig

export EDITOR='nvim'


export FZF_DEFAULT_COMMAND='find . -not -path "*/.git/*" 2>/dev/null'
export FZF_TMUX=1

export DOTFILES_REPO="$HOME/.dot"
