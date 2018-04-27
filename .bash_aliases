# DISABLE MOUSE STICK. Should not be here
#xinput disable "AlpsPS/2 ALPS DualPoint Stick"
export alt_color='\033]11;#1d1f21\007' 
export EDITOR='nvim'
export COLORTERM='rxvt-unicode-256color'
export OBSTACLE_AVOIDANCE_WORKSPACE=~/workspace/ros/obstacle_avoidance_catkin_ws
export OBSTACLE_AVOIDANCE_PROJECT=$OBSTACLE_AVOIDANCE_WORKSPACE/src/obstacle_avoidance_project
export ROS_WS=$OBSTACLE_AVOIDANCE_WORKSPACE
export DEBFULLNAME="Manuel Castillo Lopez"
export DEBEMAIL="manuelcloop@gmail.com"
alias update='sudo apt -y update; sudo apt -y upgrade; sudo apt -y dist-upgrade; sudo apt -y autoremove'
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias ld='ls -d */'
alias lda='ls -d */ .*/'
alias lf='find . -maxdepth 1 -type f'
alias vim='nvim'
alias vimconf='vim ~/.config/nvim/init.vim'
alias bashconf='vim ~/.bash_aliases'
alias bashsource='source ~/.bashrc'
alias i3cd='cd ~/.config/i3/'
alias i3conf='vim ~/.config/i3/config'
alias urconf='vim ~/.Xresources.d/urxvt'
alias mpccd='roscd drone_mpc_controller && cd ..'
alias gioscd='roscd gios_common && cd ..'
alias phdcd='cd ~/Dropbox/1_Trabajo/1_PhD'
alias catkin_make='catkin_make -DCMAKE_BUILD_TYPE=Release'
alias latex_make='pdflatex --shell-escape root && bibtex root && pdflatex --shell-escape root && pdflatex --shell-escape root'
bind '"\C-t":"printf ${alt_color}\C-m"'
bind '"\C-o":"ranger-cd\C-m"'
bind '"\C-g":"git status\C-m"'

if [ -f /opt/ros/kinetic/setup.bash ]; then
    source /opt/ros/kinetic/setup.bash
fi
if [ -f $OBSTACLE_AVOIDANCE_WORKSPACE/devel/setup.bash ]; then
    source $OBSTACLE_AVOIDANCE_WORKSPACE/devel/setup.bash
fi
if [ -f ~/.local/share/icons-in-terminal/icons_bash.sh ]; then
    source ~/.local/share/icons-in-terminal/icons_bash.sh
fi
xrdb -merge ~/.Xresources
xrdb -I$HOME ~/.Xresources

function dop(){
  xdg-open "$1" &
}

function findcd(){
  OUT=$(find -name "$1" -printf '%h\n' -quit)
 # if [ $(echo $OUT | wc -l) -gt 1 ]; then
 #   echo "Not the only one"
 #   echo $OUT
 #   return
 # fi
  cd "$OUT"
}
function autopush(){
  git add .
  git commit -m "Tracking changes on drone_mpc"
  git push origin master
}

function ranger-cd(){
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

function undetach(){ 
    git checkout -b temp 
    git checkout -B $1 temp 
    git branch -d temp  
} 
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
parse_tmux_pane(){
	if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  	tmux display -pt "${TMUX_PANE:?}" '(#{pane_index})'
	fi
}

#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\[\e]0;\u@\h /\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "
