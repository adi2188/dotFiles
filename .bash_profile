HOME=/Users/aditya
export HOME
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
export PATH
export STORM_HOME=$HOME/apache-storm-0.10.0
export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export GOPATH=/usr/local/go/bin
export PATH=$JAVA_HOME/bin:$PATH:$STORM_HOME/bin
export PATH="/Users/aditya/.pyenv/bin:$PATH"
#export GITAWAREPROMPT=/Users/aditya/.adibash/git-aware-prompt
#source "${GITAWAREPROMPT}/main.sh"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

#export PS1="[\u@\h \[$txtgrn\]\W\[$txtrst\]] \[$txtylw\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] ▹ "

#   -----------------------------
#   VELOCITY
#   -----------------------------

alias whoworkshard='git log --since="last 2 weeks" | grep "^Author: " | sort | uniq -c | sort -n -r'

#   -----------------------------
#   SET JAVA
#   -----------------------------

alias setJdk6='export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)'
alias setJdk7='export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias setJdk8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias setJdk9='export JAVA_HOME=$(/usr/libexec/java_home -v '9*')'

#   -----------------------------
#   MAKE TERMINAL BETTER
#   -----------------------------


alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation 
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias desk='cd ~/Desktop'
alias up='cd ..'
function upn(){ for i in `seq $1`; do cd ..; done;}
function makego { mkdir $1; cd $1;}
alias cl='clear; ls -lhG'
alias cla='clear; ls -lhAG'
alias la='ls -lhAG $LS_COLOR'
alias ls="ls -G"
alias pg='ps axw | grep -i'
alias plg='port list | grep -i'
alias manu='clear; ls -lhAG'
alias mytree="find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/'"
alias hgrep='history | grep '"${1}"''
alias self='cd ~/self'

#   ---------------------------
#   SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   ---------------------------
#   SMART UTILS
#   ---------------------------

# using brew install get
# 1. ack
# 2. ag (Silver Searcher)
# 3. fpp (Facebook PathPicker)
# 4. fsql (File SQL)

alias pick='fpp'

#   -----------------------------
#   MAVEN GRADLE BUILDS
#   -----------------------------


function cdl { cd $1; la;}
mvnrun () {
    echo mvn $@
    eval mvn $@
    echo mvn $@
}
gradlerun () {
    echo gradle $@
    eval gradle $@
    echo gradle $@
}
alias gci='gradlerun clean install'
alias gcist='gradlerun clean install -x test'

alias mci='mvnrun clean install'
alias mcist='mvnrun clean install -Dmaven.test.skip=true $@'
alias mt='mvnrun test $@'
alias mc='mvnrun clean $@'
alias mct='mvnrun clean test $@'
alias mist='mvnrun install -Dmaven.test.skip=true $@'

lsnet(){
        lsof -i  | awk '{printf("%-14s%-20s%s\n", $10, $1, $9)}' | sort
}

function mosh_to { mosh $1;}
function connect { ssh $1;}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
if [ -e /Users/aditya/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/aditya/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="/usr/local/opt/protobuf@2.5/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

source ~/.git_prompt
export GIT_PS1_SHOWCOLORHINTS=true
# Terminal Prompt:
# Include git branch, use PROMPT_COMMAND (not PS1) to get color output (see git-prompt.sh for more)
export PROMPT_COMMAND='__git_ps1 "\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\W \[\033[00m\]" "\\\$ "' # Git branch (relies on git-prompt.sh)
export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=false
export GIT_PS1_SHOWUPSTREAM="auto"
