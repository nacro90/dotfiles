zplug "mafredri/zsh-async", from:github

# Themes and prompts{{{

# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "startship/startship", from:github, as:theme
# zplug "themes/kennethreitz", use:kennethreitz.zsh-theme, from:oh-my-zsh, as:theme
# zplug "themes/mh", use:mh.zsh-theme, from:oh-my-zsh, as:theme
# zplug "themes/imajes", use:imajes.zsh-theme, from:oh-my-zsh, as:theme
# zplug "subnixr/minimal", use:minimal.zsh, as:theme
# zplug "themes/miloshadzic", use:miloshadzic.zsh-theme, from:oh-my-zsh, as:theme
# zplug "gdsrosa/minimal_improved", use:minimal_improve.zsh-theme,  as:theme
# zplug "samuelb/samshell", use:samshell.zsh-theme, as:theme
zplug "mengelbrecht/slimline"

# defer means to load this plugin after all the other plugins
zplug "zdharma/fast-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-syntax-highlighting", from:github

# zplug "zpm-zsh/ls"

zplug "plugins/colored-man-pages", from:oh-my-zsh

# zplug "zpm-zsh/dircolors-material", from:github

# enhanced zsh vim mode
# zplug "softmoth/zsh-vim-mode"
export KEYTIMEOUT=1

# zplug "laurenkt/zsh-vimto"
# export VIMTO_COLOR_NORMAL_TEXT=black
# export VIMTO_COLOR_NORMAL_BACKGROUND=green

# }}}

# Aliases and completions {{{

zplug "zsh-users/zsh-autosuggestions", defer:3

zplug "hlissner/zsh-autopair", defer:2

zplug "plugins/fzf", from:oh-my-zsh

zplug "hschne/fzf-git"

zplug "mdumitru/git-aliases" 

zplug "srijanshetty/zsh-pandoc-completion", lazy:true

zplug "akoenig/npm-run.plugin.zsh", lazy:true

zplug "plugins/archlinux", from:oh-my-zsh

zplug "plugins/common-aliases", from:oh-my-zsh

zplug "plugins/mvn", from:oh-my-zsh, lazy:true

zplug "plugins/docker", from:oh-my-zsh, lazy:true

zplug "plugins/tmux", from:oh-my-zsh

zplug "kutsan/zsh-system-clipboard"

zplug "plugins/pipenv", from:oh-my-zsh

# }}}

