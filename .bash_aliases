# DISABLE MOUSE STICK. Should not be here
#xinput disable "AlpsPS/2 ALPS DualPoint Stick"
export alt_color='\033]11;#1d1f21\007' 
export EDITOR='nvim'
export COLORTERM='rxvt-unicode-256color'
export OBSTACLE_AVOIDANCE_WORKSPACE=~/workspace/ros/obstacle_avoidance_catkin_ws
export OBSTACLE_AVOIDANCE_PROJECT=$OBSTACLE_AVOIDANCE_WORKSPACE/src/obstacle_avoidance_project
export ROS_WS=$OBSTACLE_AVOIDANCE_WORKSPACE
alias update='sudo apt-get update; sudo apt-get upgrade; sudo apt-get dist-upgrade; sudo apt-get autoremove'
alias vim='nvim'
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias vimconf='vim ~/.config/nvim/init.vim'
alias bashconf='vim ~/.bash_aliases'
alias bashsource='source ~/.bashrc'
alias i3conf='vim ~/.config/i3/config'
bind '"\C-t":"printf ${alt_color}\C-m"'
bind '"\C-o":"ranger-cd\C-m"'

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