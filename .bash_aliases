# iterm2
# . ~/.iterm2_shell_integration.bash

. ~/.bash_constants

# [for crontab](http://askubuntu.com/a/55026/138835)
export EDITOR="/usr/local/bin/vim"

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Tell 'ls' to be colorful
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacedx

# Show git branch
pgb() {
    git branch --no-color | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' -e 's/(master)//'
}
export PS1='\n\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[33m\]$(pgb)\[\033[00m\]\$ '
# PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
# export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE};"

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Set locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PYTHONIOENCODING=UTF-8   # http://stackoverflow.com/a/6361471/1054939

# Tons of misc aliases
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias rm='rm -i'
alias tl='tree -L 2'
alias open='/usr/bin/open'
alias vi='/usr/local/bin/vim'
alias duh='du -d 0 -h'
alias duhs='du -hs * | gsort -h'
alias pyserv='python -m SimpleHTTPServer'
alias profile='python -m cProfile'
alias profilec='python -m cProfile --sort=cumulative'
#alias python='hilite time python'
alias python3='time python3'
alias agi="ag --ignore-dir"
alias agg="ag -g"
alias ports="lsof -Pn -i4 | grep LISTEN"
alias rmed='find . -type d -empty -delete'
alias tsvcut="csvcut -t"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias sourceb="source ~/.bashrc"
alias e2u="iconv -f euckr -t utf8"
alias prettyjson="python3 -m json.tool"
alias bleulook="sed 's/[_a-zA-Z]* *= *//g; s/)//g; s/\//,/g; s/ (/,/g' | csvsort -r -c bleu | csvlook"
alias bleubar="sed 's/[_a-zA-Z]* *= *//g; s/)//g' | csvsort -r -c bleu | csvcut -c engine,bleu | tail -n +2 | sed 's/,/ /' | bar_chart.py -Avr -m 100"

# rsync -e ssh -avz some/dir/. me@remote:dir/. # http://sr128.org/blog/?p=90
# for many small files
alias rscp="rsync -r --ignore-existing --progress --rsh=ssh"
# for a few big files
alias rscpb="rsync -r --partial --progress --rsh=ssh"

# gae
alias gae='dev_appserver.py --port=8192 .'
alias gaeup='appcfg.py update .'

# github/gist
alias gistc='git clone git@gist.github.com:'
alias gistup="gistup --private --"

# dbs
alias start_mongo='mongod --fork'
alias stop_mongo='killall -SIGTERM mongod 2>/dev/null'
alias status_mongo="killall -0 mongod 2>/dev/null; if [ \$? -eq 0 ]; then echo 'started'; else echo 'stopped'; fi"
alias start_pg='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias stop_pg='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias status_pg='pg_ctl -D /usr/local/var/postgres status'

# tmux
#alias tmux_clean="tmux kill-session -a -t `tmux display-message -p "#S"`"
alias tmux_rw="tmux rename-window"
alias ta="tmux attach || tmux"

# Open apps
alias pbcopy='reattach-to-user-namespace pbcopy'
alias open='reattach-to-user-namespace open'
alias skim='open -a Skim'
alias chrome='open -a Google\ Chrome'
alias safari='open -a Safari'
alias jnote='jupyter notebook --notebook-dir $HOME/dev'

# Server aliases
alias s_merci='autossh -M 10024 merci -t "tmux attach"'
alias s_pam='autossh -M 10025 pamplona -t "tmux attach"'
alias s_pop='autossh -M 10026 joker -t "tmux attach"'
alias s_g21='autossh -M 10027 smtgpu21 -t "tmux attach || tmux"'
alias s_43="ssh nhn -t 43"
alias s_43s="ssh nhn -t 43s"
alias s_mtcompare="ssh nhn -t mtcompare"
alias s_mtcompares="ssh nhn -t mtcompares"

# Others
alias nw="vi $WIKI_DIR/careers/numberworks.markdown"
alias pe="vi $WIKI_DIR/others/people.markdown"
alias pa="vi $WIKI_DIR/projects/papago.markdown"
alias mt="vi $WIKI_DIR/dm/mt.markdown"
alias na="vi $WIKI_DIR/careers/naver.markdown"


# Set paths
# [Change Java versions](http://superuser.com/a/731099/137947)
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
setjdk() {
  export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}

# Spark
export SPARK_HOME="$HOME/dev/pkgs/spark-2.0.0-bin-hadoop2.7"
PATH=$PATH:$SPARK_HOME/bin

# MacTeX
PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin
export JYTHON_HOME=/usr/local/Cellar/jython/2.7.0/libexec

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# export RBENV_ROOT=/usr/local/opt/rbenv

# fasd
alias s='fasd -si'                      # show / search / select
alias c='fasd_cd -b current'            # cd in current folder
alias cc='fasd_cd -b current -i'        # cd in current folder (interactive)
alias v='fasd -e vim -b current'        # open file in current folder
alias vv='fasd -e vim -b current -i'    # open file in current folder (interactive)
alias zz='fasd_cd -d -i'                # global cd (interactive)
eval "$(fasd --init auto)"
. ~/.fasdrc
alias f="open ." # overwrite f

# [virtualenvwrapper](https://virtualenvwrapper.readthedocs.org/en/latest/)
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# export WORKON_HOME=~/envs
# mkdir -p $WORKON_HOME
# source /usr/local/bin/virtualenvwrapper.sh

# [autoenv](https://github.com/kennethreitz/autoenv)
# source `which activate.sh`

# nvm
export NVM_DIR="$HOME/.nvm"
# NOTE: The following line is VERY SLOW
alias sourcen='. "$(brew --prefix nvm)/nvm.sh"'


# bash history logging
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

# https://github.com/daleroberts/itermplot
export MPLBACKEND="module://itermplot"
export ITERMPLOT="rv"
