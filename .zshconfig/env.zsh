
# ls en couleur !
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;37:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.ko=01;32'

ZLS_COLORS=$LS_COLORS


# cvs
export EDITOR="emacs -nw"
export VISUAL="emacs"

# Divers... (logcheck is the time, in seconds, between checks)
export LOGCHECK=60
export WATCHFMT="%n has %a %l from %M"
export WATCH=all
export READNULLCMD=less
export LESS="-q -R"
export PAGER=less
export MANPAGER=less
export PATH="${HOME}/local/bin:${HOME}/local/texlive/2016/bin/x86_64-linux/:${PATH}"
export PYTHONPATH="/home/${USER}/local/lib/python2.7/site-packages:${PYTHONPATH}"
umask 006
