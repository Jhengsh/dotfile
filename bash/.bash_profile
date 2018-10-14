# Set Alias in Terminal
alias ll='ls -lah'
alias rm='trash'

# tmux alias
alias tm='tmux'
alias tma='tmux a -t'
alias tml='tmux ls'

# docker alias
alias di='docker images'
alias de='docker exec'
alias dps='docker ps -a'
alias drm='docker rm'
alias drma='dRmAll'
alias drmi='docker rmi'
alias drmin='dRmNone'
alias dstart='docker start'
alias dstop='docker stop'
alias dstopa='dStopAll'
alias dr='docker run'
alias dn='docker network'

# Set pyenv
export PYENV_ROOT=/usr/local/var/pyenv
if which pyenv >/dev/null; then eval "$(pyenv init -)"; fi

# Set R locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# User define function
function gityapf() {
	git status | tee | grep 'modified\|new file' | grep .py | sed 's/modified://g' | sed 's/new file://g' | xargs -n1 yapf -ir
}

function dRmAll() {
	docker ps -qa --filter "status=exited" | xargs -n 1 docker rm
}

function dRmNone() {
	docker images | awk '{if ( $1 == "<none>" ) print $3}' | xargs -n 1 docker rmi
}

function drmc() {
	docker ps -aq --filter "status=created" | xargs -n 1 docker rm
}

function dStopAll() {
	docker ps -aq | xargs -n 1 docker stop
}

function convpy() {
	sed -e ':a' -e 'N' -e '$!ba' -e 's/\n\n# In\[[0-9\]*]:\n\n/ /g' $1 | sed -n '2,$'p
}
