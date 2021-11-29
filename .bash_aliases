# Aliases & bindings{{{
alias ls='ls -1q --classify --group-directories-first --color=auto'
alias la='ls -A'
alias ld='ls -d */'
alias lda='ls -d */ .*/'
alias lf='find . -maxdepth 1 -type f'
alias da='deactivate'
alias vim='nvim'
alias vimcd='cd ~/.config/nvim'
alias vimconf='vim ~/.config/nvim/init.vim'
alias bashconf="vim ~/.bash_aliases"
alias bashsource='source ~/.bashrc'
alias matlab='matlab & $() && sleep 10 && exit'
bind '"\C-o":"ranger-cd\C-m"'
bind '"\C-g":"git status .\C-m"'
#}}}

# Functions {{{

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

# parse_git_branch{{{
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
#}}}

# parse_tmux_pane{{{
parse_tmux_pane(){
	if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
  	tmux display -pt "${TMUX_PANE:?}" '(#{pane_index})'
	fi
}
#}}}

# vi_mode{{{
vi_mode(){
  TEST=`bind -v | awk '/keymap/ {print $NF}'`
  if [ "$TEST" = 'vi-insert' ]; then
     echo -ne "\033]12;Green\007"
  else
     echo -ne "\033]12;Red\007"
  fi
}
#}}}

#custom_terminal_prompt{{{
function custom_terminal_prompt(){
  export PS1="\[\e]0;\u@\h /\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "
}
#}}}

# workcd{{{
function workcd(){
    cd $HOME/main_ws/work
}
#}}}

# mpccd{{{
function mpccd(){
    cd $HOME/main_ws/work/empotech/mpc_project
}
#}}}

#}}}

# Configs {{{

export MAIN_WS="${HOME}/main_ws"
export EDITOR='nvim'
keypro us 
custom_terminal_prompt

# ROS{{{
export ROS_DISTRO="noetic"
export ROS_WS="${HOME}/temp_ws/catkin_ws"
source "/opt/ros/${ROS_DISTRO}/setup.bash"
source $ROS_WS/devel/setup.bash
export FLIGHTMARE_PATH="${ROS_WS}/src/flightmare"
#}}}

# ROS2 {{{
# export ROS_DISTRO="galactic"
# export ROS_DOMAIN_ID=0
# export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
# export ROS_WS="${HOME}/catkin_ws"
# source "/opt/ros/${ROS_DISTRO}/setup.bash"
# source $ROS_WS/devel/setup.bash
#}}}

# ACADO {{{
# source "${HOME}/manuel_ws/acado_ws/acado/build/acado_env.sh"
#}}}

# ACADOS {{{
export ACADOS_ROOT="${HOME}/main_ws/third_party/acados"
export ACADOS_SOURCE_DIR="${ACADOS_ROOT}"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${ACADOS_ROOT}/lib"
#}}}

# CASADI {{{
# export PYTHONPATH=$PYTHONPATH:"${HOME}/workspace/casadi-linux-py35-47c5d06"
#}}}

# YARN {{{
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#}}}

#}}}

##### DEPRECATED ######{{{

# update {{{
# function update(){
#   sudo apt -y update
#   sudo apt -y upgrade
#   sudo apt -y dist-upgrade
#   sudo apt -y autoremove
#   sudo snap refresh
# }
#}}}

# xdg open {{{
# function dop(){
#   xdg-open "$1" &
# }
#}}}

# keypro{{{ 
# function keypro(){
#   lang="$1"
#   if [ -z "$1" ]
#   then
#     echo "No language selected. Provide it as argument (es/us)."
#   else
#     setxkbmap -layout $lang
#     setxkbmap -option && setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape'
#     gsettings set org.gnome.settings-daemon.plugins.keyboard active false
#   fi
# }
#}}}

# keynormal{{{ 
# function keynormal(){
#   lang="$1"
#   if [ -z "$1" ]
#   then
#     echo "No language selected. Provide it as argument (es/us)."
#   else
#     setxkbmap -layout $lang
#     setxkbmap -option 
#     gsettings set org.gnome.settings-daemon.plugins.keyboard active false
#   fi
# }
#}}}

# undetach{{{
# function undetach(){ 
#   branch="$1"
#   if [ -z "$1" ]
#   then
#     echo "No branch selected. Provide it as argument."
#   else
#     git checkout -b temp 
#     git checkout -B $branch temp 
#     git branch -d temp  
#   fi
# } 
#}}}

# bedtime{{{
# function bedtime(){
#   t=$1
#   if [ -z "$t" ]
#   then
#     echo "No time selected. Provide it as argument."
#   else
#     sleep $((60*60*t)) && poweroff
#   fi
# }
#}}}

# mousewake{{{
# function mousewake(){
#   sudo modprobe -r psmouse
#   sudo modprobe psmouse
# }
#}}}

# rr_dirs{{{
# function rr_dirs(){
#   path="$1"
#   find_string="$2"
#   replace_string="$3"
#   if [ -z "$3" ]
#   then
#     echo "Need three arguments: use find_replace path find_string replace_string"
#   else
#     cd $path
#     find . -type d -name "*$find_string*" -exec rename s/$find_string/$replace_string/ '{}' +
#     wait
#     cd - > /dev/null
#   fi
# }
#}}}

# rr_text{{{
# function rr_text(){
#   path="$1"
#   find_string="$2"
#   replace_string="$3"
#   if [ -z "$3" ]
#   then
#     echo "Need three arguments: use find_replace path find_string replace_string"
#   else
#     cd $path
#     find . -type f -name "*.*" -exec sed -i -e "s/$find_string/$replace_string/g" '{}' \;
#     wait
#     cd - > /dev/null
#   fi
# }
#}}}

# rr_files{{{
# function rr_files(){
#   path="$1"
#   find_string="$2"
#   replace_string="$3"
#   if [ -z "$3" ]
#   then
#     echo "Need three arguments: use find_replace path find_string replace_string"
#   else
#     cd $path
#     find . -type f -name "*$find_string*" -exec rename s/$find_string/$replace_string/ '{}' +
#     wait
#     cd - > /dev/null
#   fi
# }
#}}}

# rr_all{{{
# function rr_all(){
#   path="$1"
#   find_string="$2"
#   replace_string="$3"
#   if [ -z "$3" ]
#   then
#     echo "Need three arguments: use find_replace path find_string replace_string"
#   else
#     rr_text $path $find_string $replace_string
#     rr_dirs $path $find_string $replace_string
#     rr_files $path $find_string $replace_string
#   fi
# }
#}}}

# roscpptemplate{{{
# function roscpptemplate(){
#   pkg_name="$1"
#   git clone git@github.com:manucalop/ros_cpp_template.git
#   if [ -z "$1" ]
#   then
#     echo "No pkg_name argument supplied. Using default"
#   else
#     echo "Creating $pkg_name package..."
#     rm -rf ros_cpp_template/.git
#     rm ros_cpp_template/README.md
#     rr_all ros_cpp_template/ ros_cpp_template $pkg_name
#     mv ros_cpp_template "$pkg_name"
#   fi
# }
#}}}

#tags_update{{{
# function tags_global_update(){
#   ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.config/nvim/tags/ros_cpp /opt/ros/melodic/include/
#   ctags -R --fields=+iaS --extra=+q -f ~/.config/nvim/tags/ros_all /opt/ros/melodic/include/
#   ctags -R --fields=+iaS --extra=+q -f ~/.config/nvim/tags/usr_all_tags /usr/include/
# }

# function tags_local_update(){
#   ctags -R --fields=+iaS --extra=+q .
# }
#}}}

#latex_make {{{
# function latex_make(){
#   file="$1"
#   if [ -z "$1" ]
#   then
#     echo "No file selected"
#   else
#     pdflatex --shell-escape $file &&
#     bibtex $file &&
#     pdflatex --shell-escape $file &&
#     rm *.aux *.blg *.log *.out *.toc *.bcf  *.nav *.run.xml *.snm
#   fi
# }
#}}}

# venv {{{
# function venv(){
#   env="$1"
#   if [ -z "$1" ]
#   then
#     echo "No environment selected these are available:"
#     ls ~/.venv/
#   else
#   source ~/.venv/$env/bin/activate
#   fi
# }
#}}}

# spotify{{{
# function spotify(){
#   exec spotify --force-device-scale-factor=2 %U &
#   exit
# }
#}}}

# lfs_mkdir{{{
# function lfs_mkdir(){
#   main_path="$HOME/main_ws"
#   target_path="$(pwd)"
#   main2target_path="$(realpath --relative-to=$main_path $target_path)"
#   echo "$main_path"
#   echo "$target_path"
#   echo "$main2target_path"
#   cd "$main_path"
#   ./setup_large_files.bash "$main2target_path"
#   cd "$target_path"
# }
#}}}

#}}}
