
bindkey -e

bindkey "^[OH" beginning-of-line	# Home
bindkey "^[OF" end-of-line		# End
bindkey "[3~" delete-char		# Del
bindkey "[2~" overwrite-mode		# Insert
bindkey "[5~" beginning-of-history	# PgUp
bindkey "[6~" end-of-history		# PgDn
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" emacs-forward-word
bindkey "^[[1;3D" emacs-backward-word

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# Use showkey (sudo) to get the key format from the keyboard
# The list of Zsh function is the zshzle manual
bindkey '^[[3;5~' delete-word
bindkey '^[[3;3~' delete-word        # CTRL + DEL

# bindkey '^w'      kill-region
# bindkey '^[w'     copy-region-as-kill

bindkey '^H'      backward-delete-word # CTRL + BACKSPACE


# Consider path as multiple words separated by '/', '-', '\' or '.'
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#-#}"
WORDCHARS="${WORDCHARS:s#\\#}"
WORDCHARS="${WORDCHARS:s#.#}"
WORDCHARS="${WORDCHARS:s#_#}"

# by default: export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
# we take out the slash, period, angle brackets, dash here.
# export WORDCHARS='*?_[]~=&;!#$%^(){}'
# Everything splits the word
export WORDCHARS=''

## From http://chneukirchen.org/blog/archive/2011/02/10-more-zsh-tricks-you-may-not-know.html
# Complete in history with M-/, M-,
zstyle ':completion:history-words:*' list no
zstyle ':completion:history-words:*' menu yes
zstyle ':completion:history-words:*' remove-all-dups yes
bindkey "\e/" _history-complete-older
bindkey "\e," _history-complete-newer

# # Move to where the arguments belong.
# after-first-word() {
#     zle beginning-of-line
#     zle forward-word
# }
# zle -N after-first-word
# bindkey "^X1" after-first-word


# x-copy-region-as-kill () {
#     zle copy-region-as-kill
#     print -rn $CUTBUFFER | xsel -ip
# }
# zle -N x-copy-region-as-kill
# x-kill-region () {
#     zle kill-region
#     print -rn $CUTBUFFER | xsel -ip
# }
# zle -N x-kill-region
# x-yank () {
#     CUTBUFFER=$(xsel -o -p </dev/null)
#     zle yank
# }
# zle -N x-yank
# bindkey -e '\ew' x-copy-region-as-kill
# bindkey -e '^w' x-kill-region
# bindkey -e '^y' x-yank
