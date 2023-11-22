
function clean_python_packages(){
  /usr/bin/pip3 freeze --user | xargs /usr/bin/pip3 uninstall -y
}
