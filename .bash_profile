PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
export PATH

alias desk='cd ~/Desktop'
alias up='cd ..'
function cdl { cd $1; ls;}
function makego { mkdir $1; cd $1;}
alias cl='clear; ls -lhG'
alias cla='clear; ls -lhAG'
alias ll='ls -lhG'
alias la='ls -lhAG'
alias ls="ls -G"
alias pg='ps axw | grep -i'
alias plg='port list | grep -i'

lsnet(){ 
        lsof -i  | awk '{printf("%-14s%-20s%s\n", $10, $1, $9)}' | sort 
}

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file
