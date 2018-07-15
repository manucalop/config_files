# DISABLE MOUSE STICK. Should not be here
#xinput disable "AlpsPS/2 ALPS DualPoint Stick"
export EDITOR='nvim'
export COLORTERM='rxvt-unicode-256color'
export OBSTACLE_AVOIDANCE_WORKSPACE=~/workspace/ros/obstacle_avoidance_catkin_ws
export AFI_PROJ_WORKSPACE=~/workspace/ros/afi_ws
export AFI_PROJ_PROJECT=~/workspace/ros/afi_ws/src/afi_project
export OBSTACLE_AVOIDANCE_PROJECT=$OBSTACLE_AVOIDANCE_WORKSPACE/src/obstacle_avoidance_project
export ROS_WS=$OBSTACLE_AVOIDANCE_WORKSPACE
export DEBFULLNAME="Manuel Castillo Lopez"
export DEBEMAIL="manuelcloop@gmail.com"
export PYTHONPATH=$PYTHONPATH:~/workspace/casadi-linux-py35-47c5d06
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
alias mpccd='roscd drone_mpc_obstacle_avoidance && cd ../..'
alias gioscd='roscd gios_common && cd ..'
alias phdcd='cd ~/Dropbox/1_Trabajo/1_PhD'
alias catkin_make='catkin_make -DCMAKE_BUILD_TYPE=Release; source devel/setup.bash'
alias latex_make='pdflatex --shell-escape root && bibtex root && pdflatex --shell-escape root && pdflatex --shell-escape root'
bind '"\C-o":"ranger-cd\C-m"'
bind '"\C-g":"git status .\C-m"'

if [ -f /opt/ros/kinetic/setup.bash ]; then
    source /opt/ros/kinetic/setup.bash
fi
if [ -f $AFI_PROJ_WORKSPACE/devel/setup.bash ]; then
    source $AFI_PROJ_WORKSPACE/devel/setup.bash
fi
#if [ -f $OBSTACLE_AVOIDANCE_WORKSPACE/devel/setup.bash ]; then
#    source $OBSTACLE_AVOIDANCE_WORKSPACE/devel/setup.bash
#fi
if [ -f ~/.local/share/icons-in-terminal/icons_bash.sh ]; then
    source ~/.local/share/icons-in-terminal/icons_bash.sh
fi

xrdb -merge ~/.Xresources
#xrdb -I$HOME ~/.Xresources

# xdg open {{{
function dop(){
  xdg-open "$1" &
}
#}}}

# findcd{{{ 
function findcd(){
  OUT=$(find -name "$1" -printf '%h\n' -quit)
 # if [ $(echo $OUT | wc -l) -gt 1 ]; then
 #   echo "Not the only one"
 #   echo $OUT
 #   return
 # fi
  cd "$OUT"
}
#}}}

# ranger-cd{{{
function ranger-cd(){
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}
#}}}

# undetach{{{
function undetach(){ 
  branch="$1"
  if [ -z "$1" ]
  then
    echo "No branch selected. Provide it as argument."
  else
    git checkout -b temp 
    git checkout -B $branch temp 
    git branch -d temp  
  fi
} 
#}}}

# bedtime{{{
function bedtime(){
  t=$1
  if [ -z "$t" ]
  then
    echo "No time selected. Provide it as argument."
  else
    sleep $((60*60*t)) && poweroff
  fi
}
#}}}

# bedtime{{{
function mousewake(){
  sudo modprobe -r psmouse
  sudo modprobe psmouse
}
#}}}

# roscpptemplate{{{
function roscpptemplate(){
  pkg_name="$1"
  git clone https://manuelcloop@bitbucket.org/manuelcloop/ros_cpp_template.git
  if [ -z "$1" ]
  then
    echo "No pkg_name argument supplied. Using default"
  else
    echo "Creating $pkg_name package..."
    rm -rf ros_cpp_template/.git
    rm ros_cpp_template/README.md
    sed -i "s/ros_cpp_template/$pkg_name/g" ros_cpp_template/CMakeLists.txt
    sed -i "s/ros_cpp_template/$pkg_name/g" ros_cpp_template/package.xml
    sed -i "s/ros_cpp_template/$pkg_name/g" ros_cpp_template/src/ros_cpp_template.cpp
    sed -i "s/ros_cpp_template/$pkg_name/g" ros_cpp_template/src/ros_cpp_template_node.cpp
    mv ros_cpp_template/include/ros_cpp_template/ros_cpp_template.h ros_cpp_template/include/ros_cpp_template/"$pkg_name".h 
    mv ros_cpp_template/src/ros_cpp_template.cpp ros_cpp_template/src/"$pkg_name".cpp 
    mv ros_cpp_template/src/ros_cpp_template_node.cpp ros_cpp_template/src/"$pkg_name"_node.cpp 
    mv ros_cpp_template/include/ros_cpp_template ros_cpp_template/include/"$pkg_name"
    mv ros_cpp_template "$pkg_name"
  fi
}
#}}}

#tags_update{{{
function tags_global_update(){
  ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.config/nvim/tags/ros_cpp /opt/ros/kinetic/include/
  ctags -R --fields=+iaS --extra=+q -f ~/.config/nvim/tags/ros_all /opt/ros/kinetic/include/
  ctags -R --fields=+iaS --extra=+q -f ~/.config/nvim/tags/usr_all_tags /usr/include/
}

function tags_local_update(){
  ctags -R --fields=+iaS --extra=+q .
}
#}}}

# Custom terminal prompt{{{
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
parse_tmux_pane(){
	if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  	tmux display -pt "${TMUX_PANE:?}" '(#{pane_index})'
	fi
}

export PS1="\[\e]0;\u@\h /\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "
#}}}

