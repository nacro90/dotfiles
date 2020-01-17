# Settings and options {{{

# Enable colors and change prompt:
autoload -U colors && colors

# History {{{
# The number of commands to save.
HISTSIZE=50000
# The history is trimmed when its length excedes SAVEHIST by 20%.
SAVEHIST=10000

HISTFILE="$HOME/.local/share/zsh/history"

# Time stamp the history, and more.
setopt extended_history
# Add commands to the history file as soon as they are run.
setopt inc_append_history
# Time stamp the history, and more.
setopt share_history
# When searching for history entries in the line editor, do not display duplicates of a line previously found.
setopt hist_find_no_dups      
# Avoid duplication when adding a new command.
setopt hist_ignore_all_dups   
# If you run the same command multiple times in a row, only add it to the history once.
setopt hist_ignore_dups
# Trim duplicated commands from the history before trimming unique commands.
setopt hist_expire_dups_first
# Remove command lines from the history list when the first character on the line is a space.
setopt hist_ignore_space      
# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt hist_save_no_dups      
# Show before executing history commands.
setopt hist_verify            
# Add commands as they are typed, don't wait until shell exit.
setopt inc_append_history     

# }}}

# Misc {{{

# Allow comments even in interactive shells.
setopt interactive_comments   
# List jobs in the long format by default.
setopt long_list_jobs         
# Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt notify                 

# }}}

# Changing directories {{{ 
# Use the shorthand ~/Downloads for cd ~/Downloads.
setopt auto_cd
# Keep a directory stack of all the directories you cd to in a session.
# setopt auto_pushd
unsetopt pushd_ignore_dups
# Use Git-like -N instead of the default +N (e.g. cd -2 as opposed to cd +2).
setopt pushd_minus

# }}}

# Completions {{{

# AB⇥ to show a menu of all completion suggestions. TAB⇥ a second time to enter the menu. 
# TAB⇥ again to circulate through the list, or use the arrow keys. ENTER to accept a completion from the menu.
setopt auto_menu
# Move the cursor to the end of the word after accepting a completion.
setopt always_to_end
# If you type TAB⇥ in the middle of a word, the cursor will move to the end of the word and zsh will open the completions menu.
# (I.e. type add, hit LEFT←, and then TAB⇥, the cursor will move to after the second d and completions will be shown for add
setopt complete_in_word
# Expand expressions in braces to allow things like `echo {a-g}`.
setopt brace_ccl              
# Disables the use of ⌃S to stop terminal output and the use of ⌃Q to resume it.
unsetopt flow_control
# If set, this option prevents the completion menu from showing even if AUTO_MENU is set.
unsetopt menu_complete

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/cache

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
# And if you want the number of errors allowed by _approximate to increase with the length of what you have typed so far:
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

zstyle ':completion:*:functions' ignored-patterns '_*'

autoload -U compinit

zmodload zsh/complist
compinit

# GLOBDOTS lets files beginning with a . be matched without explicitly specifying the dot.
setopt globdots
setopt extended_glob


# }}}

# Use vim keys in tab complete menu:{{{
#
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# export KEYTIMEOUT=1

# Autosuggestions {{{

# export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# export ZSH_AUTOSUGGEST_USE_ASYNC=1
# export ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=''
# export ZSH_AUTOSUGGEST_CLEAR_WIDGETS='vi-next-char'
# bindkey '^ ' autosuggest-accept

# }}}

# HOME and END {{{
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
# }}}

# }}}

# Delete key {{{
bindkey '^[[3' prefix-2
bindkey '^[[3~' delete-char
bindkey -v '^[[3' prefix-2
bindkey -v '^[[3~' delete-char
# }}} 

# Edit line in vim with ctrl-e:{{{

autoload edit-command-line
zle -N edit-command-line
bindkey '\C-e' edit-command-line

# }}}

# non-modal history {{{
bindkey -v '\C-p' history-search-backward
bindkey -v '\C-n' history-search-forward

# }}}

# }}}

# }}}



# Prompt (DISABLED) {{{

# PS1='%F{red}%B$ %f%b'
# RPROMPT='[%F{yellow}%?%f]'


# }}}


# Zplug {{{

source $ZPLUG_HOME/init.zsh

# echo $ZPLUG_LOADFILE for packages.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# }}}

# # Change cursor shape for different vi modes.{{{

 # function zle-keymap-select {
  # if [[ ${KEYMAP} == vicmd ]] ||
     # [[ $1 = 'block' ]]; then
    # echo -ne '\e[1 q'
  # elif [[ ${KEYMAP} == main ]] ||
       # [[ ${KEYMAP} == viins ]] ||
       # [[ ${KEYMAP} = '' ]] ||
       # [[ $1 = 'beam' ]]; then
    # echo -ne '\e[5 q'
  # fi
 # }
 # zle -N zle-keymap-select
 # zle-line-init() {
    # zle -K viins initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    # echo -ne "\e[5 q"
 # }
 # zle -N zle-line-init
 # echo -ne '\e[5 q' Use beam shape cursor on startup.
 # preexec() { echo -ne '\e[5 q' ;} Use beam shape cursor for each new prompt.

# }}}

bindkey -v


# Aliases {{{

alias ls="ls --color=auto"

alias reload="source $ZDOTDIR/.zshrc"

alias vim="nvim"

alias pacman-list-packages="pacman -Qi | awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' | sort -hr | head -25"

alias tmux='tmux -f ~/.config/tmux/tmux.conf'

alias dotgit='/usr/bin/git --git-dir=$HOME/.dot --work-tree=$HOME' 

# Config aliases {{{
alias zshconfig="$EDITOR ~/.zshrc"
alias zshcfg="$EDITOR $XDG_CONFIG_HOME/zsh/.zshrc"

alias zplugpackages="$EDITOR ~/.config/zsh/zplug/packages.zsh"
alias alacrittyconfig="$EDITOR ~/.config/alacritty/alacritty.yml"
alias stconfig="$EDITOR ~/.local/lib/st*/config.h"
alias dmenuconfig="$EDITOR ~/.local/lib/dmenu*/config.h"
alias zathuraconfig="$EDITOR ~/.config/zathura/zathurarc"
alias xinitconfig="$EDITOR ~/.xinitrc"
alias xresourcesconfig="$EDITOR ~/.Xresources"
alias dwmconfig="$EDITOR ~/.local/lib/dwm/config.h"
alias surfconfig="$EDITOR ~/.local/lib/surf/config.h"
alias i3config="$EDITOR ~/.config/i3/config"
alias i3blocksconfig="$EDITOR ~/.config/i3blocks/config"
alias tmuxconfig="$EDITOR ~/.tmux/tmux.conf"
alias roficonfig="$EDITOR ~/.config/rofi/config"
alias dunstconfig="$EDITOR ~/.config/dunst/dunstrc"
alias comptonconfig="$EDITOR ~/.config/compton/compton.conf"
# alias vimconfig="$EDITOR ~/.vim/.vimrc"
alias nvimconfig="$EDITOR ~/.config/nvim/init.vim"
alias todoconfig="$EDITOR ~/.todo/config"
# }}}

# Makes {{{
alias makedwm="sudo make -C $DWM_HOME -f $DWM_HOME/Makefile install"
alias makesurf="sudo make -C $SURF_HOME -f $SURF_HOME/Makefile install"
alias makest="sudo make -C $ST_HOME -f $ST_HOME/Makefile install"
alias makedmenu="sudo make -C $DMENU_HOME -f $DMENU_HOME/Makefile install"
#}}}

# Git {{{

# alias gcam='git add --all && git commit -m'
# alias gca='git add --all && git commit'
# alias gc='git commit'
# alias gcm='git commit -m'
# alias gch='git checkout'
# alias gs='git status -v'
# alias g='git'
# alias gcb='git checkout -b'

# }}}

# Todo
alias todotxt="$EDITOR ~/doc/note/todo.txt"
alias t="todo.sh"
alias quick="$EDITOR ~/doc/note/quick.org"

alias git-dotfiles='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'
# }}}


# Functions {{{

function mkcd {
  mkdir -p $1 && cd $1
}

function mkx {
  echo "#!/usr/bin/env sh\n\n\n# vim: ft=sh" >> "$1" && chmod +x "$1" && $EDITOR "$1"
}

# }}}

# Execution on startup {{{

# pfetch

# }}}
