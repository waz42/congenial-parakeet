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
# Prompt
#------------------------------------------
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
