
DEF="%{[0m%}"
BLACK="%{[1;30m%}"
RED="%{[1;31m%}"
GREEN="%{[1;32m%}"
YELLOW="%{[1;33m%}"
BLUE="%{[1;34m%}"
PINK="%{[1;35m%}"
CYAN="%{[1;36m%}"
WHITE="%{[1;37m%}"

setopt NO_all_export
setopt correct			# Try to correct the spelling of commands, using dvorak examination
setopt auto_cd			# ajoute automatiquement 'cd'
setopt auto_list		# Automatically list choices on an ambiguous completion
setopt complete_aliases		# Completion option
setopt complete_in_word		# Completion option
setopt equals			# Perform = filename expansion

setopt glob			# filename generation
setopt NO_extended_glob		# Assume  '#', '~' and '^' as part of patterns for filename generation
setopt null_glob		# If a pattern for filename generation has no matches, delete the pattern from the argument list instead of reporting an error. Overrides NOMATCH.
setopt NO_glob_subst		# Avoid incompatibilities

setopt hash_cmds		# Note the location of each command
setopt hash_dirs
setopt no_mail_warning
setopt magic_equal_subst
setopt numeric_glob_sort
setopt append_history		# Write history in append mode
setopt hist_ignore_dups		# Avoid duplicating older command in the history
setopt hist_ignore_space
setopt nohup

autoload zmv			# zmv. THE real useful mv.
autoload incremental-complete-word

# Turn on completion
autoload -U compinit
compinit -i ${HOME}/.zcompdump

## filename suffixes to ignore during completion
# fignore=(.o)

#
#  :completion:<func>:<completer>:<command>:<argument>:<tag>
#
zstyle ':completion:*' format '%{[33m%}-> %{[1m%}%d%{[0m%}'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-=]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:processes' list-colors '=(#b)(?????)(#B)?????????????????????????????????([^ ]#/)#(#b)([^ /]#)*=00=01;31=01;33'
zstyle ':*:hosts' beast ns stbccHP samba ftpfae webserver svnserver CompilServ vmlInuxNico playerDTV troll bNico
