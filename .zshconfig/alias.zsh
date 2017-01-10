
alias ..='cd ..'
alias 'p'='cd ..'
alias ll='ls -lh'
alias la='ls -lA'
alias mv='nocorrect mv -i'
alias mmv='noglob zmv -W'
alias cp='nocorrect cp -i'
alias rm='nocorrect rm'
alias mkdir='nocorrect mkdir'
alias reboot='shutdown -r now'
alias off='shutdown -h now'
alias clnbck='rm -f *~'
alias who='who|sort'
alias rm="rm -i"

alias ls='ls --color=auto'
alias l='ls'
alias lm='ls | more'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=.svn'
alias gnus='emacs -f gnus &'
alias gr='grep -rnIHC1'

# emacs no window
alias ne='emacs -nw'

for com in alias expr find which ; do
    alias $com="noglob $com"
done

# Show current path in term title
[ -t 1 ] && {
  chpwd() {
    case $TERM in
      sun-cmd) print -Pn "\e]l%n@%m %~\e\\" ;;
      *xterm*|rxvt|(k|E|dt)term) print -Pn "\e]0;%n@%m %~\a" ;;
    esac
  }
  chpwd
}
