
source ~/.zshconfig/git_completion.sh

function precmd {

    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    PR_FILLBAR=""
    PR_PWDLEN=""
    PR_PLATFORM="$DVD_PLATFORM"

    local promptsize=${#${(%):---(+%n@%m)-$DVD_PLATFORM--(%D{%H:%M})---}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
	    ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    else
	PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
	#PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize))).. .)}"
    fi
}

setprompt () {

    setopt prompt_subst

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
    fi
    for color in BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval $color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval LIGHT_$color='%{$fg[${(L)color}]%}'
	(( count = $count + 1 ))
    done
    DEF="%{$terminfo[sgr0]%}"

    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    PR_SET_CHARSET="%{$terminfo[enacs]%}"
    PR_SHIFT_IN="%{$terminfo[smacs]%}"
    PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    PR_HBAR=${altchar[q]:--}
    PR_ULCORNER=${altchar[l]:--}
    PR_LLCORNER=${altchar[m]:--}
    PR_LRCORNER=${altchar[j]:--}
    PR_URCORNER=${altchar[k]:--}

    MCOLOR="$YELLOW"
#    PROMPT='$PR_SET_CHARSET${GREEN}%n@%m ${BLUE}$(basename ${PWD}) $YELLOW$(__git_ps1 "(%s)") ${BLUE}%(!.#.$)$DEF '
    PROMPT='$PR_SET_CHARSET${GREEN}%n@%m ${BLUE}$(basename ${PWD}) ${BLUE}%(!.#.$)$DEF '
    RPROMPT=' $PR_SHIFT_IN$BLUE$PR_SHIFT_OUT\
($MCOLOR%(?,${GREEN}0,$RED%139(?,Seg fault,\
%130(?,Interrupt,%138(?,Bus Error,%?)))$RED)\
$BLUE)$DEF'

    SPROMPT='zsh: correct $MCOLOR%R$DEF to $MCOLOR%r$DEF%b ? (['$MCOLOR'Y$DEF]es/\
['$MCOLOR'N$DEF]o/['$MCOLOR'E$DEF]dit/['$MCOLOR'A$DEF]bort) '

    PS2='$BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$BLUE$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
$MCOLOR%_$BLUE)$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
$BLACK$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT$DEF '
}

setprompt
