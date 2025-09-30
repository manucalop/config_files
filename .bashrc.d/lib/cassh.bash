# https://hub.docker.com/r/leboncoin/cassh/
# Define a function in your bashrc/zshrc
cassh() {
    sudo docker pull leboncoin/cassh:latest
    sudo docker run --net host -it -u $(id -u) -e HOME=${HOME} -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v ~/.cassh:${HOME}/.cassh:ro -v ~/.ssh:${HOME}/.ssh --rm leboncoin/cassh $@
}
