# .zshenv
# .zprofile
# .zshrc
# .zlogin
# .zlogout

source $HOME/.google-cloud-sdk/completion.zsh.inc
source $HOME/.google-cloud-sdk/path.zsh.inc

echo "Load .zshrc"
alias rm='rm -i'

alias gcp='gcloud'
alias gcei='gcloud compute instances'

alias ga='git add'
alias gaa='git add --all'
alias gamd='git commit --amend'
alias gap='git add -p'
alias gb='git branch'
alias gbd='git branch | fzf -m | xargs git branch -d'
alias gcb='git branch | fzf | xargs git checkout'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gdf='git diff'
alias gds='git diff --staged'
alias gfd='git diff --name-only'
alias gwd='git diff --color-words'
alias gec='git commit --allow-empty -m'
alias gf='git fetch'
alias gfp='git push --force-with-lease origin head'
alias gl='git log --oneline -8'
alias gms='git merge --squash'
alias gpl='git pull'
alias gps='git push origin head'
alias gr='git rebase'
alias grb='git branch | fzf | xargs git rebase'
alias grc='git rebase --continue'
alias grl='git reflog -8'
alias gs='git status'
alias gss='git status --short'
alias gsh='git stash'
alias gsr='git reset --soft'
alias gus='git reset HEAD'
alias gwp='git commit -a -m "wip"'

alias mimiadmin='cd $candle/mimi_admin; docker run  -it -p 80:3000 -v $candle/mimi_admin/:/opt --name mimi_admin_dev --rm ruby:2.3.0 /bin/bash'
alias be='bundle exec'
alias bi='bundle install --path=vendor/bundle'

alias psf='ps ax | fzf'
alias anws='aws --profile anny'

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

alias ls="ls -GF"
alias lf="ls -F | grep -v /"
alias ll='ls -lFG'
alias l='ls -lFG'
alias la='ls -lFGa'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='env LC_ALL=en java -Dfile.encoding=UTF-8'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
alias cap2='cap _2.15.5_'
alias gre='grep -Ir . -e'

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit
setopt auto_param_slash

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# beepをならさない
setopt nobeep

## TAB で順に補完候補を切り替える
setopt auto_menu

setopt magic_equal_subst
setopt mark_dirs

#export LS_COLORS='di=01;36'
export LSCOLORS=gxfxcxdxbxegedabagacad
export LANG=ja_JP.UTF-8 

#set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
#
# ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000



# PROMPT
#	colors
#	black:   0
#	red:     1
#	green:   2
#	yellow:  3
#	blue:    4
#	magenta: 5
#	cyan:    6
#	white:   7

setopt prompt_subst

# Detail: man zshcontrib
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # add system like this: git cvs svn
# default
# zstyle ':vcs_info:*' actionformats \
	# 	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
# zstyle ':vcs_info:*' formats       \
	# 	'%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' formats       \
	'[%F{2}%b%f]'
precmd () { vcs_info }

# ex: PS1='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_}%f%# '
PS1='%F{6}%c%f/ ${vcs_info_msg_0_}%f%# '

RPS1='[@%F{2}%m%f]'
#SPROMPT="correct: %R -> %r ? "  # error 時

# Ruby
eval "$(rbenv init -)"

# Language
# Python
# alias ipython='ipython --pylab'
# export PATH=$PATH:~/Library/Enthought/Canopy_64bit/User/bin
export PATH=$HOME/.bin:$PATH
export PROGRAMMING_ROOT=~/programming
export GITHUB_ROOT=$PROGRAMMING_ROOT/github
export SCRIPT_ROOT=$PROGRAMMING_ROOT/shellscripts

export PYTHONPATH=$CAFFE_ROOT/python:$PYTHONPATH

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
	zcompile ~/.zshrc
fi

# file 分割したい時
# ZSH_MODULES_DIR 以下にfileを追加
# 
# ZSH_MODULES_DIR=${HOME}/.zsh_modules
# if [ -d $ZSH_MODULES_DIR ] && [ ! -z $(ls -A $ZSH_MODULES_DIR) ]; then
# 	for file in $ZSH_MODULES_DIR/*; do
# 		source $file
# 	done
# fi

# refs: man test
# http://motw.mods.jp/shellscript/tutorial.html#condition
# http://shellscript.sunone.me/if_and_test.html#and-条件-1
# https://open-groove.net/shell/conditional-expression/
# http://itpro.nikkeibp.co.jp/article/COLUMN/20060227/230705/
#
# 
export COMPANY_ROOT=~/programming/github
export trenders=$COMPANY_ROOT/trenders
export candle=$COMPANY_ROOT/candle
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=$HOME/.nodebrew

export PYENV_ROOT=$HOME/.pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

ec2-list() {
    aws ec2 describe-instances | jq -r '.Reservations[] | .Instances[] | [.InstanceId,.PublicIpAddress,.PrivateIpAddress,.State.Name,"# "+(.Tags[] | select(.Key == "Name") | .Value // "")] | join("\t")'
}

ssh-anny-magazine() {
    MYSECURITYGROUP="sg-49b93c2c"
    SSH_KEY="/Users/ryosuke/.ssh/anny_web_staging_ec2_a.pem"
    MYIP=`curl -s http://httpbin.org/ip | jq -r .origin`
    aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
    ssh -i $SSH_KEY ec2-user@$1
    aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
}

ssh-anny-magazine-server() {
    MYSECURITYGROUP="sg-8f604eea"
    SSH_KEY="/Users/ryosuke/.ssh/anny.pem"
    MYIP=`curl -s http://httpbin.org/ip | jq -r .origin`
    aws ec2 authorize-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
    ssh -i $SSH_KEY ec2-user@$1
    aws ec2 revoke-security-group-ingress --group-id $MYSECURITYGROUP --protocol tcp --port 22 --cidr $MYIP/32
}

# i-575220c8	52.69.93.113	10.0.0.89	running	# docker-anny-magazine-production_a
ssh-prod-anny-a() {
  ssh-anny-magazine 52.69.93.113;
}

# 54.238.155.66
ssh-prod-anny-a2() {
  ssh-anny-magazine 54.238.155.66;
}

# i-75e8dffa	103.4.11.41	10.0.1.29	running	# docker-anny-magazine-production_c
ssh-prod-anny-c() {
  ssh-anny-magazine 103.4.11.41;
}

# i-34ca7191	52.68.21.220	10.0.0.28	running	# anny-magazine-app-production_a
ssh-prod-cms-a() {
  ssh-anny-magazine-server 52.68.21.220;
}

# i-bef1de1c	52.192.76.227	10.0.1.98	running	# anny-magazine-app-production_c
ssh-prod-cms-c() {
  ssh-anny-magazine-server 52.192.76.227;
}

# i-ca1c8255	52.197.30.3	10.0.0.160	running	# docker-anny-magazine-staging_a
ssh-stage-anny-a() {
  ssh-anny-magazine 52.197.30.3;
}

# i-0cbd1af0bbf64b54e	54.238.243.250	10.0.1.119	running	# docker-anny-magazine-staging_c2
ssh-stage-anny-c() {
  # Old IP 54.238.243.250
  ssh-anny-magazine 13.115.252.110;
}

# i-6c89f3e3	54.199.203.235	10.0.1.89	running	# anny-magazine-staging-api
ssh-stage-cms() {
  ssh-anny-magazine-server 54.199.203.235;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export EDITOR='vim'

alias sksk="cd $GITHUB_ROOT/nishisuke"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$PROGRAMMING_ROOT/go
