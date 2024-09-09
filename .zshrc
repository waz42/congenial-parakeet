#------------------------------------------
# Divide .zshrc
#------------------------------------------

ZSHHOME="${HOME}/dotfiles/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
   for i in $ZSHHOME/*; do
       [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
   done
fi

#------------------------------------------
# git setting
#------------------------------------------
source ~/.git/git-prompt.sh

fpath=(~/.git $fpath)
zstyle ':completion:*:*:git:*' script ~/.git/git-completion.bash
autoload -Uz compinit && compinit

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

#------------------------------------------
# Prompt
#------------------------------------------
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
