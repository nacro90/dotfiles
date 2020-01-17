#!/bin/sh
wmname LG3D
export _JAVA_AWT_WM_NONREPARENTING=1

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export TERMINAL='st'
export BROWSER='firefox'
export VISUAL="vim"
export IMGVIEWER='sxiv'
export PDFVIEWER='zathura'
export MEDIAPLAYER='mpv'
export FILEBROWSER='lf'

export SXHKD_SHELL='/bin/sh'

# Brave, ..
export GDK_DPI_SCALE=1.2
# KeePassXC, ...
export QT_SCALE_FACTOR=1.1
# export WINIT_HIDPI_FACTOR=1.1
# export SPOTIFY_SCALE_FACTOR=1.1

# Autolock screen
xautolock -secure -time 5 -corners 0-+0 -cornerdelay 3 -locker slock &

# Configure screens via xrandr
setup-screens

# Notification daemon
dunst --config ~/.config/dunst/dunstrc &

# Statusbar
# dwmblocks &

# Nightlight
xflux -l 41 -g 28

# Set keyboard preferences
setkbpref

sxhkd &

exec bspwm


